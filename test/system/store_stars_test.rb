require "application_system_test_case"

class StoreStarsTest < ApplicationSystemTestCase
  setup do
    @store_star = store_stars(:one)
  end

  test "visiting the index" do
    visit store_stars_url
    assert_selector "h1", text: "Store stars"
  end

  test "should create store star" do
    visit store_stars_url
    click_on "New store star"

    fill_in "Number", with: @store_star.number
    fill_in "Reviewers", with: @store_star.reviewers
    fill_in "Store", with: @store_star.store_id
    click_on "Create Store star"

    assert_text "Store star was successfully created"
    click_on "Back"
  end

  test "should update Store star" do
    visit store_star_url(@store_star)
    click_on "Edit this store star", match: :first

    fill_in "Number", with: @store_star.number
    fill_in "Reviewers", with: @store_star.reviewers
    fill_in "Store", with: @store_star.store_id
    click_on "Update Store star"

    assert_text "Store star was successfully updated"
    click_on "Back"
  end

  test "should destroy Store star" do
    visit store_star_url(@store_star)
    click_on "Destroy this store star", match: :first

    assert_text "Store star was successfully destroyed"
  end
end
