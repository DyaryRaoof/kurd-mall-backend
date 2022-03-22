require_relative '../serializers/store_serializer'

class StoresController < ApplicationController
  before_action :authenticate_user!, except: %i[index show show_store home_index subcategory_stores]
  before_action :set_store, only: %i[show edit update destroy]

  # GET users/:id/stores or users/:id/stores.json
  def index
    @q = Store.where(user_id: params[:user_id]).ransack(params[:q])
    @stores = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
  end

  # GET users/:id/stores/1 or users/:id/stores/1.json
  def show; end

  def show_store
    @store = Store.find(params[:id])
    render json: StoreSerializer.new(@store).serializable_hash[:data][:attributes]
  end

  # GET users/:id/stores/new
  def new
    @store = Store.new
  end

  # GET users/:id/stores/1/edit
  def edit; end

  # POST users/:id/stores or users/:id/stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html do
          redirect_to user_store_url(user_id: params[:user_id], id: @store.id),
                      notice: 'Store was successfully created.'
        end
        format.json do
          # render :show, status: :created, location: user_store_url(user_id: params[:user_id], id: @store.id)
          render json: StoreSerializer.new(@store).serializable_hash[:data][:attributes], status: :created
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT users/:id/stores/1 or users/:id/stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to user_store_url(id: @store.id), notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE users/:id/stores/1 or users/:id/stores/1.json
  def destroy
    @store.destroy

    respond_to do |format|
      format.html { redirect_to user_stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home_index
    @stores = []
    subs = JSON.parse(params[:subcategory_ids])
    count = Store.count;
    @stores = if count < 100
               Store.all.with_attached_images
             else
              Store.where(subcategory_id: subs).limit(300).with_attached_images
             end
    options = {}
    options[:is_collection] = true
    hash = StoreSerializer.new(@stores, options).serializable_hash[:data]
    json_string = StoreSerializer.new(@stores, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  def subcategory_stores
    @stores = []
    subs = params[:subcategory_id]
    @stores = Store.where(subcategory_id: subs).paginate(page: params[:page], per_page: 30).with_attached_images
    options = {}
    options[:is_collection] = true
    hash = StoreSerializer.new(@stores, options).serializable_hash[:data]
    json_string = StoreSerializer.new(@stores, options).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:user_id, :name, :description, :address, :phone, :instagram, :facebook,
                                  :locaation_long, :location_lat, :is_approved,
                                  :category_id, :subcategory_id, :city_id, :images, images: [])
  end
end
