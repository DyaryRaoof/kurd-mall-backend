class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  # GET users/:id/stores or users/:id/stores.json
  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
  end

  # GET users/:id/stores/1 or users/:id/stores/1.json
  def show; end

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
        format.json { render :show, status: :created, location: @store }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:user_id, :name, :description, :address, :phone, :instagram, :facebook,
                                  :locaation_long, :location_lat, :is_approved,
                                  :category_id, :subcategory_id, :city_id, images: [])
  end
end
