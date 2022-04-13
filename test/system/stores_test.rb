require 'application_system_test_case'

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test 'visiting the index' do
    visit stores_url
    assert_selector 'h1', text: 'Stores'
  end

  test 'should create store' do
    visit stores_url
    click_on 'New store'

    fill_in 'Address', with: @store.address
    fill_in 'Description', with: @store.description
    fill_in 'Facebook', with: @store.facebook
    fill_in 'Instagram', with: @store.instagram
    check 'Is approved' if @store.is_approved
    fill_in 'Locaation long', with: @store.locaation_long
    fill_in 'Location lat', with: @store.location_lat
    fill_in 'Name', with: @store.name
    fill_in 'Phone', with: @store.phone
    fill_in 'User', with: @store.user_id
    click_on 'Create Store'

    assert_text 'Store was successfully created'
    click_on 'Back'
  end

  test 'should update Store' do
    visit store_url(@store)
    click_on 'Edit this store', match: :first

    fill_in 'Address', with: @store.address
    fill_in 'Description', with: @store.description
    fill_in 'Facebook', with: @store.facebook
    fill_in 'Instagram', with: @store.instagram
    check 'Is approved' if @store.is_approved
    fill_in 'Locaation long', with: @store.locaation_long
    fill_in 'Location lat', with: @store.location_lat
    fill_in 'Name', with: @store.name
    fill_in 'Phone', with: @store.phone
    fill_in 'User', with: @store.user_id
    click_on 'Update Store'

    assert_text 'Store was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Store' do
    visit store_url(@store)
    click_on 'Destroy this store', match: :first

    assert_text 'Store was successfully destroyed'
  end
end
