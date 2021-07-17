require 'test_helper'

class MeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meat = meats(:one)
  end

  test "should get index" do
    get meats_url
    assert_response :success
  end

  test "should get new" do
    get new_meat_url
    assert_response :success
  end

  test "should create meat" do
    assert_difference('Meat.count') do
      post meats_url, params: { meat: { accounts_id: @meat.accounts_id, cat_type: @meat.cat_type, price: @meat.price, qty: @meat.qty } }
    end

    assert_redirected_to meat_url(Meat.last)
  end

  test "should show meat" do
    get meat_url(@meat)
    assert_response :success
  end

  test "should get edit" do
    get edit_meat_url(@meat)
    assert_response :success
  end

  test "should update meat" do
    patch meat_url(@meat), params: { meat: { accounts_id: @meat.accounts_id, cat_type: @meat.cat_type, price: @meat.price, qty: @meat.qty } }
    assert_redirected_to meat_url(@meat)
  end

  test "should destroy meat" do
    assert_difference('Meat.count', -1) do
      delete meat_url(@meat)
    end

    assert_redirected_to meats_url
  end
end
