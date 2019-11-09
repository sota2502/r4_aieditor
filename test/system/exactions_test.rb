require "application_system_test_case"

class ExactionsTest < ApplicationSystemTestCase
  setup do
    @exaction = exactions(:one)
  end

  test "visiting the index" do
    visit exactions_url
    assert_selector "h1", text: "Exactions"
  end

  test "creating a Exaction" do
    visit exactions_url
    click_on "New Exaction"

    fill_in "Name", with: @exaction.name
    fill_in "Project", with: @exaction.project_id
    click_on "Create Exaction"

    assert_text "Exaction was successfully created"
    click_on "Back"
  end

  test "updating a Exaction" do
    visit exactions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @exaction.name
    fill_in "Project", with: @exaction.project_id
    click_on "Update Exaction"

    assert_text "Exaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Exaction" do
    visit exactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exaction was successfully destroyed"
  end
end
