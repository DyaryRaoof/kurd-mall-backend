require_relative '../serializers/item_serializer'
require 'json'

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show home_index related_items]
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @q = Item.where(user_id: params[:user_id], store_id: params[:store_id]).ransack(params[:q])
    @items = @q.result(distinct: true).paginate(page: params[:page], per_page: 3)
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params.except(:variants, :tags))

    respond_to do |format|
      if @item.save
        save_item_variants
        save_tags

        format.html { redirect_to user_store_item_path(id: @item), notice: 'Item was successfully created.' }
        format.json do
          options = {}
          options[:include] = %i[item_variants tags]
          render json: ItemSerializer.new(@item, options).serializable_hash[:data][:attributes], status: :created
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to user_store_item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home_index
    @items = []
    subs = JSON.parse(params[:subcategory_ids])
    # subs.each do |sub|
    #   @items += Item.includes(:item_variants, :tags).where(subcategory_id: sub).limit(3).with_attached_images
    # end
    count = Item.count
    @items = if count < 100
               Item.includes(:item_variants, :tags, :latest_5_comments, :item_stars).all.with_attached_images
             else
               Item.includes(:item_variants, :tags, :latest_5_comments,
                             :item_stars).where(subcategory_id: subs).limit(100).with_attached_images
             end

    @items.each do |item|
      item.latest_5_comments.first(5)
      item.stars = {}
      sum_of_star_numbers = 0
      item.item_stars.each do |star|
        sum_of_star_numbers += star.number
      end

      item.stars['number'] = (sum_of_star_numbers / item.item_stars.size).ceil
      item.stars['reviewers'] = item.item_stars.length
    end

    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    hash = ItemSerializer.new(@items, options).serializable_hash
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def related_items
    @items = Item.includes(:item_variants, :tags).where('(name = ?) or (name like ?) or (name like ?) or (name like ?)',
                                                        params[:name],
                                                        "% #{params[:name]} %",
                                                        "#{params[:name]} %",
                                                        "% #{params[:name]}").where.not(id: params[:id]).limit(30).with_attached_images
    options = {}
    options[:is_collection] = true
    options[:include] = %i[item_variants tags]
    hash = ItemSerializer.new(@items, options).serializable_hash
    json_string = ItemSerializer.new(@items, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:user_id, :store_id, :name, :description, :price, :shipping_kg, :currency, :is_approved,
                                 :category_id, :subcategory_id, :city_id, :cost, :quantity, :images, :subcategory_ids, variants: [], tags: [], images: [])
  end

  def ensure_json_request
    params[:format] == 'json' || request.headers['Accept'] =~ /json/
  end

  def save_item_variants
    @item_variants = item_params[:variants]

    @item_variants&.each do |item_variant|
      parse = JSON.parse(item_variant)
      image_index = parse['imageIndex']
      parse['image_index'] = image_index
      parse.delete('imageIndex')
      new_item_variant = ItemVariant.new(parse)
      new_item_variant.skip_image_index_presence_validation = true if ensure_json_request
      new_item_variant.item_id = @item.id
      new_item_variant.store_id = @item.store_id

      new_item_variant.save
    end
  end

  def save_tags
    @tags = item_params[:tags]
    @tags&.each do |tag|
      parse = JSON.parse(tag)
      new_tag = Tag.new(parse)
      new_tag.item_id = @item.id
      new_tag.save
    end
  end
end
