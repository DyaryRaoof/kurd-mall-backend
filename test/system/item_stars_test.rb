require 'application_system_test_case'

class ItemStarsTest < ApplicationSystemTestCase
  setup do
    @item_star = item_stars(:one)
  end

  test 'visiting the index' do
    visit item_stars_url
    assert_selector 'h1', text: 'Item stars'
  end

  test 'should create item star' do
    visit item_stars_url
    click_on 'New item star'

    fill_in 'Item', with: @item_star.item_id
    fill_in 'Number', with: @item_star.number
    fill_in 'Reviewers', with: @item_star.reviewers
    click_on 'Create Item star'

    assert_text 'Item star was successfully created'
    click_on 'Back'
  end

  test 'should update Item star' do
    visit item_star_url(@item_star)
    click_on 'Edit this item star', match: :first

    fill_in 'Item', with: @item_star.item_id
    fill_in 'Number', with: @item_star.number
    fill_in 'Reviewers', with: @item_star.reviewers
    click_on 'Update Item star'

    assert_text 'Item star was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Item star' do
    visit item_star_url(@item_star)
    click_on 'Destroy this item star', match: :first

    assert_text 'Item star was successfully destroyed'
  end
end
