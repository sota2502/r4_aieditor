require "application_system_test_case"

class HpConditionsTest < ApplicationSystemTestCase
  setup do
    @hp_condition = hp_conditions(:one)
  end

  test "visiting the index" do
    visit hp_conditions_url
    assert_selector "h1", text: "Hp Conditions"
  end

  test "creating a Hp condition" do
    visit hp_conditions_url
    click_on "New Hp Condition"

    fill_in "Exaction", with: @hp_condition.exaction_id
    fill_in "Value", with: @hp_condition.value
    click_on "Create Hp condition"

    assert_text "Hp condition was successfully created"
    click_on "Back"
  end

  test "updating a Hp condition" do
    visit hp_conditions_url
    click_on "Edit", match: :first

    fill_in "Exaction", with: @hp_condition.exaction_id
    fill_in "Value", with: @hp_condition.value
    click_on "Update Hp condition"

    assert_text "Hp condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Hp condition" do
    visit hp_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hp condition was successfully destroyed"
  end
end
