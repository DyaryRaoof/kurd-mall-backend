class StoreAnalyticsController < ApplicationController
  before_action :set_store_analytic, only: %i[show edit update destroy]

  # GET /store_analytics or /store_analytics.json
  def index
    @store_analytics = StoreAnalytic.where(store_id: params[:store_id])
  end

  # GET /store_analytics/1 or /store_analytics/1.json
  def show; end

  # GET /store_analytics/new
  def new
    @store_analytic = StoreAnalytic.new
  end

  # GET /store_analytics/1/edit
  def edit; end

  # POST /store_analytics or /store_analytics.json
  def create
    @store_analytic = StoreAnalytic.new(store_analytic_params)

    respond_to do |format|
      if @store_analytic.save
        format.html do
          redirect_to user_store_store_analytic_url(id: @store_analytic),
                      notice: 'Store analytic was successfully created.'
        end
        format.json { render :show, status: :created, location: @store_analytic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_analytics/1 or /store_analytics/1.json
  def update
    respond_to do |format|
      if @store_analytic.update(store_analytic_params)
        format.html do
          redirect_to user_store_store_analytic_url(id: @store_analytic),
                      notice: 'Store analytic was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @store_analytic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_analytics/1 or /store_analytics/1.json
  def destroy
    @store_analytic.destroy

    respond_to do |format|
      format.html { redirect_to user_store_store_analytics_url, notice: 'Store analytic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store_analytic
    @store_analytic = StoreAnalytic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_analytic_params
    params.require(:store_analytic).permit(:store_id, :store_name, :lifetime_views, :total_stars, :total_reviews,
                                           :total_shares, :total_comments, :total_revenue_usd,
                                           :total_revenue_iqd, :total_item_sales)
  end
end
