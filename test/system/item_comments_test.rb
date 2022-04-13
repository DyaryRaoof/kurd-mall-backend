require 'application_system_test_case'

class ItemCommentsTest < ApplicationSystemTestCase
  setup do
    @item_comment = item_comments(:one)
  end

  test 'visiting the index' do
    visit item_comments_url
    assert_selector 'h1', text: 'Item comments'
  end

  test 'should create item comment' do
    visit item_comments_url
    click_on 'New item comment'

    fill_in 'Description', with: @item_comment.description
    fill_in 'Item', with: @item_comment.item_id
    fill_in 'User', with: @item_comment.user_id
    fill_in 'User name', with: @item_comment.user_name
    click_on 'Create Item comment'

    assert_text 'Item comment was successfully created'
    click_on 'Back'
  end

  test 'should update Item comment' do
    visit item_comment_url(@item_comment)
    click_on 'Edit this item comment', match: :first

    fill_in 'Description', with: @item_comment.description
    fill_in 'Item', with: @item_comment.item_id
    fill_in 'User', with: @item_comment.user_id
    fill_in 'User name', with: @item_comment.user_name
    click_on 'Update Item comment'

    assert_text 'Item comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Item comment' do
    visit item_comment_url(@item_comment)
    click_on 'Destroy this item comment', match: :first

    assert_text 'Item comment was successfully destroyed'
  end
end
