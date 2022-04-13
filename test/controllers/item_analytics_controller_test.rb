require 'test_helper'

class ItemAnalyticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_analytic = item_analytics(:one)
  end

  test 'should get index' do
    get item_analytics_url
    assert_response :success
  end

  test 'should get new' do
    get new_item_analytic_url
    assert_response :success
  end

  test 'should create item_analytic' do
    assert_difference('ItemAnalytic.count') do
      post item_analytics_url,
           params: { item_analytic: { item_id: @item_analytic.item_id, item_name: @item_analytic.item_name,
                                      lifetime_views: @item_analytic.lifetime_views,
                                      total_comments: @item_analytic.total_comments,
                                      total_item_sales: @item_analytic.total_item_sales,
                                      total_revenue_iqd: @item_analytic.total_revenue_iqd,
                                      total_revenue_usd: @item_analytic.total_revenue_usd,
                                      total_reviews: @item_analytic.total_reviews,
                                      total_shares: @item_analytic.total_shares,
                                      total_stars: @item_analytic.total_stars } }
    end

    assert_redirected_to item_analytic_url(ItemAnalytic.last)
  end

  test 'should show item_analytic' do
    get item_analytic_url(@item_analytic)
    assert_response :success
  end

  test 'should get edit' do
    get edit_item_analytic_url(@item_analytic)
    assert_response :success
  end

  test 'should update item_analytic' do
    patch item_analytic_url(@item_analytic),
          params: { item_analytic: { item_id: @item_analytic.item_id, item_name: @item_analytic.item_name,
                                     lifetime_views: @item_analytic.lifetime_views,
                                     total_comments: @item_analytic.total_comments,
                                     total_item_sales: @item_analytic.total_item_sales,
                                     total_revenue_iqd: @item_analytic.total_revenue_iqd,
                                     total_revenue_usd: @item_analytic.total_revenue_usd,
                                     total_reviews: @item_analytic.total_reviews,
                                     total_shares: @item_analytic.total_shares,
                                     total_stars: @item_analytic.total_stars } }
    assert_redirected_to item_analytic_url(@item_analytic)
  end

  test 'should destroy item_analytic' do
    assert_difference('ItemAnalytic.count', -1) do
      delete item_analytic_url(@item_analytic)
    end

    assert_redirected_to item_analytics_url
  end
end
