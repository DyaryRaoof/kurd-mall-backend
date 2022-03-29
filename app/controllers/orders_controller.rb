class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @q = Order.where(item_id: params[:item_id]).ransack(params[:q])
    @orders = @q.result(distinct: true).paginate(page: params[:page], per_page: 1)
  end

  # GET /orders/1 or /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to user_store_item_order_url(id: @order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to user_store_item_order_url(id: @order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to user_store_item_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content , status: :ok }
    end
  end

  def current_orders
    @orders = Order.where(user_id: current_user.id, is_delivered: false, ordered: false)
    render json: @orders, status: :ok
  end

  def set_ordered
    order_ids = JSON.parse(params[:order_ids])
    Order.where(id: order_ids).update_all(ordered: true)
    render json: 'Orders added successfully', status: :ok
  end

  def bought_orders
    @orders = Order.where(user_id: current_user.id, is_delivered: false, ordered: true)
    render json: @orders, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :store_id, :item_id, :order_no, :driver_id, :item_name, :supplier_name,
                                  :price, :currency, :shipping_kg, :quantity, :total_weight,
                                  :total_price, :is_picked_up, :is_delivered, :order_ids, :ordered , :user_phone, :store_phone)
  end
end
