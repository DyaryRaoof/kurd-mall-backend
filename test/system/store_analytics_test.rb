require 'application_system_test_case'

class StoreAnalyticsTest < ApplicationSystemTestCase
  setup do
    @store_analytic = store_analytics(:one)
  end

  test 'visiting the index' do
    visit store_analytics_url
    assert_selector 'h1', text: 'Store analytics'
  end

  test 'should create store analytic' do
    visit store_analytics_url
    click_on 'New store analytic'

    fill_in 'Lifetime views', with: @store_analytic.lifetime_views
    fill_in 'Store', with: @store_analytic.store_id
    fill_in 'Stroe name', with: @store_analytic.stroe_name
    fill_in 'Total comments', with: @store_analytic.total_comments
    fill_in 'Total item sales', with: @store_analytic.total_item_sales
    fill_in 'Total revenue iqd', with: @store_analytic.total_revenue_iqd
    fill_in 'Total revenue usd', with: @store_analytic.total_revenue_usd
    fill_in 'Total reviews', with: @store_analytic.total_reviews
    fill_in 'Total shares', with: @store_analytic.total_shares
    fill_in 'Total stars', with: @store_analytic.total_stars
    click_on 'Create Store analytic'

    assert_text 'Store analytic was successfully created'
    click_on 'Back'
  end

  test 'should update Store analytic' do
    visit store_analytic_url(@store_analytic)
    click_on 'Edit this store analytic', match: :first

    fill_in 'Lifetime views', with: @store_analytic.lifetime_views
    fill_in 'Store', with: @store_analytic.store_id
    fill_in 'Stroe name', with: @store_analytic.stroe_name
    fill_in 'Total comments', with: @store_analytic.total_comments
    fill_in 'Total item sales', with: @store_analytic.total_item_sales
    fill_in 'Total revenue iqd', with: @store_analytic.total_revenue_iqd
    fill_in 'Total revenue usd', with: @store_analytic.total_revenue_usd
    fill_in 'Total reviews', with: @store_analytic.total_reviews
    fill_in 'Total shares', with: @store_analytic.total_shares
    fill_in 'Total stars', with: @store_analytic.total_stars
    click_on 'Update Store analytic'

    assert_text 'Store analytic was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Store analytic' do
    visit store_analytic_url(@store_analytic)
    click_on 'Destroy this store analytic', match: :first

    assert_text 'Store analytic was successfully destroyed'
  end
end
