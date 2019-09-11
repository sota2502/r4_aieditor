require "application_system_test_case"

class ProbabilitiesTest < ApplicationSystemTestCase
  setup do
    @probability = probabilities(:one)
  end

  test "visiting the index" do
    visit probabilities_url
    assert_selector "h1", text: "Probabilities"
  end

  test "creating a Probability" do
    visit probabilities_url
    click_on "New Probability"

    click_on "Create Probability"

    assert_text "Probability was successfully created"
    click_on "Back"
  end

  test "updating a Probability" do
    visit probabilities_url
    click_on "Edit", match: :first

    click_on "Update Probability"

    assert_text "Probability was successfully updated"
    click_on "Back"
  end

  test "destroying a Probability" do
    visit probabilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Probability was successfully destroyed"
  end
end
