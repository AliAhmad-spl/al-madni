require "application_system_test_case"

class MeatsTest < ApplicationSystemTestCase
  setup do
    @meat = meats(:one)
  end

  test "visiting the index" do
    visit meats_url
    assert_selector "h1", text: "Meats"
  end

  test "creating a Meat" do
    visit meats_url
    click_on "New Meat"

    fill_in "Accounts", with: @meat.accounts_id
    fill_in "Cat type", with: @meat.cat_type
    fill_in "Price", with: @meat.price
    fill_in "Qty", with: @meat.qty
    click_on "Create Meat"

    assert_text "Meat was successfully created"
    click_on "Back"
  end

  test "updating a Meat" do
    visit meats_url
    click_on "Edit", match: :first

    fill_in "Accounts", with: @meat.accounts_id
    fill_in "Cat type", with: @meat.cat_type
    fill_in "Price", with: @meat.price
    fill_in "Qty", with: @meat.qty
    click_on "Update Meat"

    assert_text "Meat was successfully updated"
    click_on "Back"
  end

  test "destroying a Meat" do
    visit meats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meat was successfully destroyed"
  end
end
