require "application_system_test_case"

class OrderVariantsTest < ApplicationSystemTestCase
  setup do
    @order_variant = order_variants(:one)
  end

  test "visiting the index" do
    visit order_variants_url
    assert_selector "h1", text: "Order variants"
  end

  test "should create order variant" do
    visit order_variants_url
    click_on "New order variant"

    fill_in "Item variant", with: @order_variant.item_variant_id
    fill_in "Order", with: @order_variant.order_id
    click_on "Create Order variant"

    assert_text "Order variant was successfully created"
    click_on "Back"
  end

  test "should update Order variant" do
    visit order_variant_url(@order_variant)
    click_on "Edit this order variant", match: :first

    fill_in "Item variant", with: @order_variant.item_variant_id
    fill_in "Order", with: @order_variant.order_id
    click_on "Update Order variant"

    assert_text "Order variant was successfully updated"
    click_on "Back"
  end

  test "should destroy Order variant" do
    visit order_variant_url(@order_variant)
    click_on "Destroy this order variant", match: :first

    assert_text "Order variant was successfully destroyed"
  end
end
