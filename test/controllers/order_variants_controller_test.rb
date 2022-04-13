require 'test_helper'

class OrderVariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_variant = order_variants(:one)
  end

  test 'should get index' do
    get order_variants_url
    assert_response :success
  end

  test 'should get new' do
    get new_order_variant_url
    assert_response :success
  end

  test 'should create order_variant' do
    assert_difference('OrderVariant.count') do
      post order_variants_url,
           params: { order_variant: { item_variant_id: @order_variant.item_variant_id,
                                      order_id: @order_variant.order_id } }
    end

    assert_redirected_to order_variant_url(OrderVariant.last)
  end

  test 'should show order_variant' do
    get order_variant_url(@order_variant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_order_variant_url(@order_variant)
    assert_response :success
  end

  test 'should update order_variant' do
    patch order_variant_url(@order_variant),
          params: { order_variant: { item_variant_id: @order_variant.item_variant_id,
                                     order_id: @order_variant.order_id } }
    assert_redirected_to order_variant_url(@order_variant)
  end

  test 'should destroy order_variant' do
    assert_difference('OrderVariant.count', -1) do
      delete order_variant_url(@order_variant)
    end

    assert_redirected_to order_variants_url
  end
end
