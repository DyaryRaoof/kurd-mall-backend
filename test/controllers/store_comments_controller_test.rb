require "test_helper"

class StoreCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_comment = store_comments(:one)
  end

  test "should get index" do
    get store_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_store_comment_url
    assert_response :success
  end

  test "should create store_comment" do
    assert_difference("StoreComment.count") do
      post store_comments_url, params: { store_comment: { description: @store_comment.description, store_id: @store_comment.store_id, user_id: @store_comment.user_id, user_name: @store_comment.user_name } }
    end

    assert_redirected_to store_comment_url(StoreComment.last)
  end

  test "should show store_comment" do
    get store_comment_url(@store_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_comment_url(@store_comment)
    assert_response :success
  end

  test "should update store_comment" do
    patch store_comment_url(@store_comment), params: { store_comment: { description: @store_comment.description, store_id: @store_comment.store_id, user_id: @store_comment.user_id, user_name: @store_comment.user_name } }
    assert_redirected_to store_comment_url(@store_comment)
  end

  test "should destroy store_comment" do
    assert_difference("StoreComment.count", -1) do
      delete store_comment_url(@store_comment)
    end

    assert_redirected_to store_comments_url
  end
end
