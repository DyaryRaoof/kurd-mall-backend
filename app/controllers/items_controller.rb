require_relative '../serializers/item_serializer'
require 'json'

class ItemsController < ApplicationController
  before_action :authenticate_user!,
                except: %i[index show home_index related_items subcategory_items search store_items show_item]
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @q = Item.where(user_id: params[:user_id], store_id: params[:store_id]).ransack(params[:q])
    @items = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
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
      if @item.update(item_params.except(:variants, :tags))
        save_item_variants(true)
        save_tags(true)
        format.html { redirect_to user_store_item_url(@item), notice: 'Item was successfully updated.' }
        format.json do
          options = {}
          options[:include] = %i[item_variants tags]
          render json: ItemSerializer.new(@item, options).serializable_hash[:data][:attributes], status: :ok
        end
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
      format.html { redirect_to user_store_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_item
    @item = Item.includes(:item_variants, :tags, :latest_5_comments,
                          :item_stars).where(id: params[:id]).with_attached_images

    add_stars(@item)
    options = {}
    options[:include] = %i[item_variants tags]
    json_string = ItemSerializer.new(@item, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  include ItemsHelperMethods

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(
      :user_id, :store_id, :name, :description,
      :price, :shipping_kg, :currency, :is_approved, :store_name, :store_phone,
      :category_id, :subcategory_id, :city_id, :cost, :quantity, :images,
      :subcategory_ids, variants: [], tags: [], images: []
    )
  end

  include ItemsHelper
end
