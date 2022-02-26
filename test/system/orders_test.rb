require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Currency", with: @order.currency
    fill_in "Driver", with: @order.driver_id
    check "Is delivered" if @order.is_delivered
    check "Is picked up" if @order.is_picked_up
    fill_in "Item", with: @order.item_id
    fill_in "Item name", with: @order.item_name
    fill_in "Order no", with: @order.order_no
    fill_in "Price", with: @order.price
    fill_in "Quantity", with: @order.quantity
    fill_in "Shipping kg", with: @order.shipping_kg
    fill_in "Store", with: @order.store_id
    fill_in "Supplier name", with: @order.supplier_name
    fill_in "Total price", with: @order.total_price
    fill_in "Total weight", with: @order.total_weight
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Currency", with: @order.currency
    fill_in "Driver", with: @order.driver_id
    check "Is delivered" if @order.is_delivered
    check "Is picked up" if @order.is_picked_up
    fill_in "Item", with: @order.item_id
    fill_in "Item name", with: @order.item_name
    fill_in "Order no", with: @order.order_no
    fill_in "Price", with: @order.price
    fill_in "Quantity", with: @order.quantity
    fill_in "Shipping kg", with: @order.shipping_kg
    fill_in "Store", with: @order.store_id
    fill_in "Supplier name", with: @order.supplier_name
    fill_in "Total price", with: @order.total_price
    fill_in "Total weight", with: @order.total_weight
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
