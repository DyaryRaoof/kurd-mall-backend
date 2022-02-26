require 'application_system_test_case'

class ItemAnalyticsTest < ApplicationSystemTestCase
  setup do
    @item_analytic = item_analytics(:one)
  end

  test 'visiting the index' do
    visit item_analytics_url
    assert_selector 'h1', text: 'Item analytics'
  end

  test 'should create item analytic' do
    visit item_analytics_url
    click_on 'New item analytic'

    fill_in 'Item', with: @item_analytic.item_id
    fill_in 'Item name', with: @item_analytic.item_name
    fill_in 'Lifetime views', with: @item_analytic.lifetime_views
    fill_in 'Total comments', with: @item_analytic.total_comments
    fill_in 'Total item sales', with: @item_analytic.total_item_sales
    fill_in 'Total revenue iqd', with: @item_analytic.total_revenue_iqd
    fill_in 'Total revenue usd', with: @item_analytic.total_revenue_usd
    fill_in 'Total reviews', with: @item_analytic.total_reviews
    fill_in 'Total shares', with: @item_analytic.total_shares
    fill_in 'Total stars', with: @item_analytic.total_stars
    click_on 'Create Item analytic'

    assert_text 'Item analytic was successfully created'
    click_on 'Back'
  end

  test 'should update Item analytic' do
    visit item_analytic_url(@item_analytic)
    click_on 'Edit this item analytic', match: :first

    fill_in 'Item', with: @item_analytic.item_id
    fill_in 'Item name', with: @item_analytic.item_name
    fill_in 'Lifetime views', with: @item_analytic.lifetime_views
    fill_in 'Total comments', with: @item_analytic.total_comments
    fill_in 'Total item sales', with: @item_analytic.total_item_sales
    fill_in 'Total revenue iqd', with: @item_analytic.total_revenue_iqd
    fill_in 'Total revenue usd', with: @item_analytic.total_revenue_usd
    fill_in 'Total reviews', with: @item_analytic.total_reviews
    fill_in 'Total shares', with: @item_analytic.total_shares
    fill_in 'Total stars', with: @item_analytic.total_stars
    click_on 'Update Item analytic'

    assert_text 'Item analytic was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Item analytic' do
    visit item_analytic_url(@item_analytic)
    click_on 'Destroy this item analytic', match: :first

    assert_text 'Item analytic was successfully destroyed'
  end
end
