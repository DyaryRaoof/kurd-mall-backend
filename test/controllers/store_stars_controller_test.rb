require "test_helper"

class StoreStarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_star = store_stars(:one)
  end

  test "should get index" do
    get store_stars_url
    assert_response :success
  end

  test "should get new" do
    get new_store_star_url
    assert_response :success
  end

  test "should create store_star" do
    assert_difference("StoreStar.count") do
      post store_stars_url, params: { store_star: { number: @store_star.number, reviewers: @store_star.reviewers, store_id: @store_star.store_id } }
    end

    assert_redirected_to store_star_url(StoreStar.last)
  end

  test "should show store_star" do
    get store_star_url(@store_star)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_star_url(@store_star)
    assert_response :success
  end

  test "should update store_star" do
    patch store_star_url(@store_star), params: { store_star: { number: @store_star.number, reviewers: @store_star.reviewers, store_id: @store_star.store_id } }
    assert_redirected_to store_star_url(@store_star)
  end

  test "should destroy store_star" do
    assert_difference("StoreStar.count", -1) do
      delete store_star_url(@store_star)
    end

    assert_redirected_to store_stars_url
  end
end
