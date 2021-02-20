require "application_system_test_case"

class AdvancesTest < ApplicationSystemTestCase
  setup do
    @advance = advances(:one)
  end

  test "visiting the index" do
    visit advances_url
    assert_selector "h1", text: "Advances"
  end

  test "creating a Advance" do
    visit advances_url
    click_on "New Advance"

    fill_in "Account", with: @advance.account_id
    fill_in "Amount", with: @advance.amount
    click_on "Create Advance"

    assert_text "Advance was successfully created"
    click_on "Back"
  end

  test "updating a Advance" do
    visit advances_url
    click_on "Edit", match: :first

    fill_in "Account", with: @advance.account_id
    fill_in "Amount", with: @advance.amount
    click_on "Update Advance"

    assert_text "Advance was successfully updated"
    click_on "Back"
  end

  test "destroying a Advance" do
    visit advances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Advance was successfully destroyed"
  end
end
