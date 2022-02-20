require "application_system_test_case"

class ItemVariantsTest < ApplicationSystemTestCase
  setup do
    @item_variant = item_variants(:one)
  end

  test "visiting the index" do
    visit item_variants_url
    assert_selector "h1", text: "Item variants"
  end

  test "should create item variant" do
    visit item_variants_url
    click_on "New item variant"

    fill_in "Cost", with: @item_variant.cost
    fill_in "Currency", with: @item_variant.currency
    fill_in "Image index", with: @item_variant.image_index
    fill_in "Item", with: @item_variant.item_id
    fill_in "Name", with: @item_variant.name
    fill_in "Price", with: @item_variant.price
    fill_in "Store", with: @item_variant.store_id
    fill_in "Value", with: @item_variant.value
    click_on "Create Item variant"

    assert_text "Item variant was successfully created"
    click_on "Back"
  end

  test "should update Item variant" do
    visit item_variant_url(@item_variant)
    click_on "Edit this item variant", match: :first

    fill_in "Cost", with: @item_variant.cost
    fill_in "Currency", with: @item_variant.currency
    fill_in "Image index", with: @item_variant.image_index
    fill_in "Item", with: @item_variant.item_id
    fill_in "Name", with: @item_variant.name
    fill_in "Price", with: @item_variant.price
    fill_in "Store", with: @item_variant.store_id
    fill_in "Value", with: @item_variant.value
    click_on "Update Item variant"

    assert_text "Item variant was successfully updated"
    click_on "Back"
  end

  test "should destroy Item variant" do
    visit item_variant_url(@item_variant)
    click_on "Destroy this item variant", match: :first

    assert_text "Item variant was successfully destroyed"
  end
end
