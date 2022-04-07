class ItemAnalyticsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_item_analytic, only: %i[show edit update destroy]

  # GET /item_analytics or /item_analytics.json
  def index
    @item_analytics = ItemAnalytic.where(store_id: params[:store_id]).paginate(page: params[:page], per_page: 30)
  end

  def item_analytics_index
    @item_analytics = ItemAnalytic.where(store_id: params[:store_id]).paginate(page: params[:page], per_page: 30)
    @item_analytics.each do |item_analytic|
      @orders = Order.where(item_id: item_analytic.item_id)
      item_analytic.total_revenue_usd = @orders.where(currency: 'USD').sum(:total_price)
      item_analytic.total_revenue_iqd = @orders.where(currency: 'IQD').sum(:total_price)
      item_analytic.total_item_sales = @orders.where(item_id: item_analytic.item_id).sum(:quantity)
    end
    render json: @item_analytics
  end

  # GET /item_analytics/1 or /item_analytics/1.json
  def show; end

  # GET /item_analytics/new
  def new
    @item_analytic = ItemAnalytic.new
  end

  # GET /item_analytics/1/edit
  def edit; end

  # POST /item_analytics or /item_analytics.json
  def create
    @item_analytic = ItemAnalytic.new(item_analytic_params)

    respond_to do |format|
      if @item_analytic.save
        format.html do
          redirect_to user_store_item_analytic_url(id: @item_analytic),
                      notice: 'Item analytic was successfully created.'
        end
        format.json { render :show, status: :created, location: @item_analytic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_analytics/1 or /item_analytics/1.json
  def update
    respond_to do |format|
      if @item_analytic.update(item_analytic_params)
        format.html do
          redirect_to user_store_item_analytic_url(id: @item_analytic),
                      notice: 'Item analytic was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @item_analytic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_analytics/1 or /item_analytics/1.json
  def destroy
    @item_analytic.destroy

    respond_to do |format|
      format.html { redirect_to user_store_item_analytics_url, notice: 'Item analytic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def views
    @item_analytic = ItemAnalytic.find_by(item_id: params[:item_id])
    if @item_analytic.nil?
      @item_analytic = ItemAnalytic.new(item_id: params[:item_id], item_name: params[:item_name],
                                        store_id: params[:store_id], lifetime_views: 1)
    else
      @item_analytic.lifetime_views += 1
    end
    @item_analytic.save
    render json: @item_analytic
  end

  def stars
    @item_analytic = ItemAnalytic.find_by(item_id: params[:item_id])
    if @item_analytic.nil?
      @item_analytic = ItemAnalytic.new(item_id: params[:item_id], item_name: params[:item_name],
                                        store_id: params[:store_id], lifetime_views: 1)
    else
      @item_analytic.lifetime_views += 1
    end
    @item_analytic.save
    render json: @item_analytic
  end

  def search
    @item_analytics = ItemAnalytic
      .where(store_id: params[:store_id])
      .where('(item_name = ?) or (item_name like ?) or (item_name like ?) or (item_name like ?)',
             params[:item_name],
             "% #{params[:item_name]} %",
             "#{params[:item_name]} %",
             "% #{params[:item_name]}")

    render json: @item_analytics
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_analytic
    @item_analytic = ItemAnalytic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_analytic_params
    params.require(:item_analytic).permit(:item_id, :item_name, :lifetime_views, :total_stars, :total_reviews,
                                          :total_shares, :total_comments, :total_revenue_usd,
                                          :total_revenue_iqd, :total_item_sales, :store_id)
  end
end
