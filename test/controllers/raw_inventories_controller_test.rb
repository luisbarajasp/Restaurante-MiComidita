require 'test_helper'

class RawInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_inventory = raw_inventories(:one)
  end

  test "should get index" do
    get raw_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_inventory_url
    assert_response :success
  end

  test "should create raw_inventory" do
    assert_difference('RawInventory.count') do
      post raw_inventories_url, params: { raw_inventory: { expired_at: @raw_inventory.expired_at, quantity: @raw_inventory.quantity } }
    end

    assert_redirected_to raw_inventory_url(RawInventory.last)
  end

  test "should show raw_inventory" do
    get raw_inventory_url(@raw_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_inventory_url(@raw_inventory)
    assert_response :success
  end

  test "should update raw_inventory" do
    patch raw_inventory_url(@raw_inventory), params: { raw_inventory: { expired_at: @raw_inventory.expired_at, quantity: @raw_inventory.quantity } }
    assert_redirected_to raw_inventory_url(@raw_inventory)
  end

  test "should destroy raw_inventory" do
    assert_difference('RawInventory.count', -1) do
      delete raw_inventory_url(@raw_inventory)
    end

    assert_redirected_to raw_inventories_url
  end
end
