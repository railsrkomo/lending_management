require "application_system_test_case"

class LendingsTest < ApplicationSystemTestCase
  setup do
    @lending = lendings(:one)
  end

  test "visiting the index" do
    visit lendings_url
    assert_selector "h1", text: "Lendings"
  end

  test "creating a Lending" do
    visit lendings_url
    click_on "New Lending"

    fill_in "Borrower", with: @lending.borrower_id
    fill_in "Expected return at", with: @lending.expected_return_at
    fill_in "Lender", with: @lending.lender_id
    fill_in "Lending at", with: @lending.lending_at
    fill_in "Name", with: @lending.name
    click_on "Create Lending"

    assert_text "Lending was successfully created"
    click_on "Back"
  end

  test "updating a Lending" do
    visit lendings_url
    click_on "Edit", match: :first

    fill_in "Borrower", with: @lending.borrower_id
    fill_in "Expected return at", with: @lending.expected_return_at
    fill_in "Lender", with: @lending.lender_id
    fill_in "Lending at", with: @lending.lending_at
    fill_in "Name", with: @lending.name
    click_on "Update Lending"

    assert_text "Lending was successfully updated"
    click_on "Back"
  end

  test "destroying a Lending" do
    visit lendings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lending was successfully destroyed"
  end
end
