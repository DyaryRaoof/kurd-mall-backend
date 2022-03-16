class ItemStarsController < ApplicationController
  before_action :set_item_star, only: %i[show edit update destroy]

  # GET /item_stars or /item_stars.json
  def index
    @item_stars = ItemStar.all
  end

  # GET /item_stars/1 or /item_stars/1.json
  def show; end

  # GET /item_stars/new
  def new
    @item_star = ItemStar.new
  end

  # GET /item_stars/1/edit
  def edit; end

  # POST /item_stars or /item_stars.json
  def create
    @item_star = ItemStar.new(number: params[:number], item_id: params[:item_id], user_id: params[:user_id])

    respond_to do |format|
      if @item_star.save
        format.html do
          redirect_to user_store_item_item_star_url(id: @item_star), notice: 'Item star was successfully created.'
        end
        format.json { render json: @item_star, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_stars/1 or /item_stars/1.json
  def update
    respond_to do |format|
      if @item_star.update(item_star_params)
        format.html do
          redirect_to user_store_item_item_star_url(id: @item_star), notice: 'Item star was successfully updated.'
        end
        format.json { render json: @item_star, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_stars/1 or /item_stars/1.json
  def destroy
    @item_star.destroy

    respond_to do |format|
      format.html { redirect_to user_store_item_item_stars_url, notice: 'Item star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_star
    @item_star = ItemStar.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_star_params
    params.require(:item_star).permit(:item_id, :number, :reviewers, :user_id)
  end
end
