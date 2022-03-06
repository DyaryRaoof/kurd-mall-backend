class StoreStarsController < ApplicationController
  before_action :set_store_star, only: %i[ show edit update destroy ]

  # GET /store_stars or /store_stars.json
  def index
    @store_stars = StoreStar.all
  end

  # GET /store_stars/1 or /store_stars/1.json
  def show
  end

  # GET /store_stars/new
  def new
    @store_star = StoreStar.new
  end

  # GET /store_stars/1/edit
  def edit
  end

  # POST /store_stars or /store_stars.json
  def create
    @store_star = StoreStar.new(store_star_params)

    respond_to do |format|
      if @store_star.save
        format.html { redirect_to user_store_store_star_url(id: @store_star), notice: "Store star was successfully created." }
        format.json { render :show, status: :created, location: @store_star }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_stars/1 or /store_stars/1.json
  def update
    respond_to do |format|
      if @store_star.update(store_star_params)
        format.html { redirect_to user_store_store_star_url(id: @store_star), notice: "Store star was successfully updated." }
        format.json { render :show, status: :ok, location: @store_star }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_stars/1 or /store_stars/1.json
  def destroy
    @store_star.destroy

    respond_to do |format|
      format.html { redirect_to user_store_store_stars_url, notice: "Store star was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_star
      @store_star = StoreStar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_star_params
      params.require(:store_star).permit(:store_id, :number, :reviewers)
    end
end
