class OrderVariantsController < ApplicationController
  before_action :set_order_variant, only: %i[show edit update destroy]

  # GET /order_variants or /order_variants.json
  def index
    @order_variants = OrderVariant.where( order_id: params[:order_id])
  end

  # GET /order_variants/1 or /order_variants/1.json
  def show; end

  # GET /order_variants/new
  def new
    @order_variant = OrderVariant.new
  end

  # GET /order_variants/1/edit
  def edit; end

  # POST /order_variants or /order_variants.json
  def create
    @order_variant = OrderVariant.new(order_variant_params)

    respond_to do |format|
      if @order_variant.save
        format.html do
          redirect_to user_store_item_order_order_variant_url(id: @order_variant),
                      notice: 'Order variant was successfully created.'
        end
        format.json { render :show, status: :created, location: @order_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_variants/1 or /order_variants/1.json
  def update
    respond_to do |format|
      if @order_variant.update(order_variant_params)
        format.html do
          redirect_to user_store_item_order_order_variant_url(id: @order_variant),
                      notice: 'Order variant was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @order_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_variants/1 or /order_variants/1.json
  def destroy
    @order_variant.destroy

    respond_to do |format|
      format.html do
        redirect_to user_store_item_order_order_variants_url, notice: 'Order variant was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_variant
    @order_variant = OrderVariant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_variant_params
    params.require(:order_variant).permit(:order_id, :item_variant_id)
  end
end
