require 'test_helper'

class OneMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @one_menu = one_menus(:one)
  end

  test "should get index" do
    get one_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_one_menu_url
    assert_response :success
  end

  test "should create one_menu" do
    assert_difference('OneMenu.count') do
      post one_menus_url, params: { one_menu: { name: @one_menu.name } }
    end

    assert_redirected_to one_menu_url(OneMenu.last)
  end

  test "should show one_menu" do
    get one_menu_url(@one_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_one_menu_url(@one_menu)
    assert_response :success
  end

  test "should update one_menu" do
    patch one_menu_url(@one_menu), params: { one_menu: { name: @one_menu.name } }
    assert_redirected_to one_menu_url(@one_menu)
  end

  test "should destroy one_menu" do
    assert_difference('OneMenu.count', -1) do
      delete one_menu_url(@one_menu)
    end

    assert_redirected_to one_menus_url
  end
end
