require "application_system_test_case"

class DetailMilksTest < ApplicationSystemTestCase
  setup do
    @detail_milk = detail_milks(:one)
  end

  test "visiting the index" do
    visit detail_milks_url
    assert_selector "h1", text: "Detail Milks"
  end

  test "creating a Detail milk" do
    visit detail_milks_url
    click_on "New Detail Milk"

    fill_in "Account", with: @detail_milk.account_id
    fill_in "Milk", with: @detail_milk.milk
    fill_in "Weight", with: @detail_milk.weight
    click_on "Create Detail milk"

    assert_text "Detail milk was successfully created"
    click_on "Back"
  end

  test "updating a Detail milk" do
    visit detail_milks_url
    click_on "Edit", match: :first

    fill_in "Account", with: @detail_milk.account_id
    fill_in "Milk", with: @detail_milk.milk
    fill_in "Weight", with: @detail_milk.weight
    click_on "Update Detail milk"

    assert_text "Detail milk was successfully updated"
    click_on "Back"
  end

  test "destroying a Detail milk" do
    visit detail_milks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detail milk was successfully destroyed"
  end
end
