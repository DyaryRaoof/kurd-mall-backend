require 'test_helper'

class ItemCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_comment = item_comments(:one)
  end

  test 'should get index' do
    get item_comments_url
    assert_response :success
  end

  test 'should get new' do
    get new_item_comment_url
    assert_response :success
  end

  test 'should create item_comment' do
    assert_difference('ItemComment.count') do
      post item_comments_url,
           params: { item_comment: { description: @item_comment.description, item_id: @item_comment.item_id,
                                     user_id: @item_comment.user_id, user_name: @item_comment.user_name } }
    end

    assert_redirected_to item_comment_url(ItemComment.last)
  end

  test 'should show item_comment' do
    get item_comment_url(@item_comment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_item_comment_url(@item_comment)
    assert_response :success
  end

  test 'should update item_comment' do
    patch item_comment_url(@item_comment),
          params: { item_comment: { description: @item_comment.description, item_id: @item_comment.item_id,
                                    user_id: @item_comment.user_id, user_name: @item_comment.user_name } }
    assert_redirected_to item_comment_url(@item_comment)
  end

  test 'should destroy item_comment' do
    assert_difference('ItemComment.count', -1) do
      delete item_comment_url(@item_comment)
    end

    assert_redirected_to item_comments_url
  end
end
