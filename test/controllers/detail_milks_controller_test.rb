require 'test_helper'

class DetailMilksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detail_milk = detail_milks(:one)
  end

  test "should get index" do
    get detail_milks_url
    assert_response :success
  end

  test "should get new" do
    get new_detail_milk_url
    assert_response :success
  end

  test "should create detail_milk" do
    assert_difference('DetailMilk.count') do
      post detail_milks_url, params: { detail_milk: { account_id: @detail_milk.account_id, milk: @detail_milk.milk, weight: @detail_milk.weight } }
    end

    assert_redirected_to detail_milk_url(DetailMilk.last)
  end

  test "should show detail_milk" do
    get detail_milk_url(@detail_milk)
    assert_response :success
  end

  test "should get edit" do
    get edit_detail_milk_url(@detail_milk)
    assert_response :success
  end

  test "should update detail_milk" do
    patch detail_milk_url(@detail_milk), params: { detail_milk: { account_id: @detail_milk.account_id, milk: @detail_milk.milk, weight: @detail_milk.weight } }
    assert_redirected_to detail_milk_url(@detail_milk)
  end

  test "should destroy detail_milk" do
    assert_difference('DetailMilk.count', -1) do
      delete detail_milk_url(@detail_milk)
    end

    assert_redirected_to detail_milks_url
  end
end
