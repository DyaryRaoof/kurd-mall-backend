require "test_helper"

class ItemStarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_star = item_stars(:one)
  end

  test "should get index" do
    get item_stars_url
    assert_response :success
  end

  test "should get new" do
    get new_item_star_url
    assert_response :success
  end

  test "should create item_star" do
    assert_difference("ItemStar.count") do
      post item_stars_url, params: { item_star: { item_id: @item_star.item_id, number: @item_star.number, reviewers: @item_star.reviewers } }
    end

    assert_redirected_to item_star_url(ItemStar.last)
  end

  test "should show item_star" do
    get item_star_url(@item_star)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_star_url(@item_star)
    assert_response :success
  end

  test "should update item_star" do
    patch item_star_url(@item_star), params: { item_star: { item_id: @item_star.item_id, number: @item_star.number, reviewers: @item_star.reviewers } }
    assert_redirected_to item_star_url(@item_star)
  end

  test "should destroy item_star" do
    assert_difference("ItemStar.count", -1) do
      delete item_star_url(@item_star)
    end

    assert_redirected_to item_stars_url
  end
end
