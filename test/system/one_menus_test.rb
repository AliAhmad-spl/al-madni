require "application_system_test_case"

class OneMenusTest < ApplicationSystemTestCase
  setup do
    @one_menu = one_menus(:one)
  end

  test "visiting the index" do
    visit one_menus_url
    assert_selector "h1", text: "One Menus"
  end

  test "creating a One menu" do
    visit one_menus_url
    click_on "New One Menu"

    fill_in "Name", with: @one_menu.name
    click_on "Create One menu"

    assert_text "One menu was successfully created"
    click_on "Back"
  end

  test "updating a One menu" do
    visit one_menus_url
    click_on "Edit", match: :first

    fill_in "Name", with: @one_menu.name
    click_on "Update One menu"

    assert_text "One menu was successfully updated"
    click_on "Back"
  end

  test "destroying a One menu" do
    visit one_menus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "One menu was successfully destroyed"
  end
end
