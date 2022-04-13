require 'test_helper'

class StoreAnalyticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_analytic = store_analytics(:one)
  end

  test 'should get index' do
    get store_analytics_url
    assert_response :success
  end

  test 'should get new' do
    get new_store_analytic_url
    assert_response :success
  end

  test 'should create store_analytic' do
    assert_difference('StoreAnalytic.count') do
      post store_analytics_url,
           params: { store_analytic: { lifetime_views: @store_analytic.lifetime_views,
                                       store_id: @store_analytic.store_id,
                                       stroe_name: @store_analytic.stroe_name,
                                       total_comments: @store_analytic.total_comments,
                                       total_item_sales: @store_analytic.total_item_sales,
                                       total_revenue_iqd: @store_analytic.total_revenue_iqd,
                                       total_revenue_usd: @store_analytic.total_revenue_usd,
                                       total_reviews: @store_analytic.total_reviews,
                                       total_shares: @store_analytic.total_shares,
                                       total_stars: @store_analytic.total_stars } }
    end

    assert_redirected_to store_analytic_url(StoreAnalytic.last)
  end

  test 'should show store_analytic' do
    get store_analytic_url(@store_analytic)
    assert_response :success
  end

  test 'should get edit' do
    get edit_store_analytic_url(@store_analytic)
    assert_response :success
  end

  test 'should update store_analytic' do
    patch store_analytic_url(@store_analytic),
          params: { store_analytic: { lifetime_views: @store_analytic.lifetime_views,
                                      store_id: @store_analytic.store_id,
                                      stroe_name: @store_analytic.stroe_name,
                                      total_comments: @store_analytic.total_comments,
                                      total_item_sales: @store_analytic.total_item_sales,
                                      total_revenue_iqd: @store_analytic.total_revenue_iqd,
                                      total_revenue_usd: @store_analytic.total_revenue_usd,
                                      total_reviews: @store_analytic.total_reviews,
                                      total_shares: @store_analytic.total_shares,
                                      total_stars: @store_analytic.total_stars } }
    assert_redirected_to store_analytic_url(@store_analytic)
  end

  test 'should destroy store_analytic' do
    assert_difference('StoreAnalytic.count', -1) do
      delete store_analytic_url(@store_analytic)
    end

    assert_redirected_to store_analytics_url
  end
end
