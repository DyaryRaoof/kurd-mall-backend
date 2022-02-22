require "application_system_test_case"

class StoreCommentsTest < ApplicationSystemTestCase
  setup do
    @store_comment = store_comments(:one)
  end

  test "visiting the index" do
    visit store_comments_url
    assert_selector "h1", text: "Store comments"
  end

  test "should create store comment" do
    visit store_comments_url
    click_on "New store comment"

    fill_in "Description", with: @store_comment.description
    fill_in "Store", with: @store_comment.store_id
    fill_in "User", with: @store_comment.user_id
    fill_in "User name", with: @store_comment.user_name
    click_on "Create Store comment"

    assert_text "Store comment was successfully created"
    click_on "Back"
  end

  test "should update Store comment" do
    visit store_comment_url(@store_comment)
    click_on "Edit this store comment", match: :first

    fill_in "Description", with: @store_comment.description
    fill_in "Store", with: @store_comment.store_id
    fill_in "User", with: @store_comment.user_id
    fill_in "User name", with: @store_comment.user_name
    click_on "Update Store comment"

    assert_text "Store comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Store comment" do
    visit store_comment_url(@store_comment)
    click_on "Destroy this store comment", match: :first

    assert_text "Store comment was successfully destroyed"
  end
end
