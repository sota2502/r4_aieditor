require "application_system_test_case"

class CancelConditionsTest < ApplicationSystemTestCase
  setup do
    @cancel_condition = cancel_conditions(:one)
  end

  test "visiting the index" do
    visit cancel_conditions_url
    assert_selector "h1", text: "Cancel Conditions"
  end

  test "creating a Cancel condition" do
    visit cancel_conditions_url
    click_on "New Cancel Condition"

    fill_in "Action rule", with: @cancel_condition.action_rule_id
    fill_in "Cancel type", with: @cancel_condition.cancel_type_id
    fill_in "Parameter1", with: @cancel_condition.parameter1
    fill_in "Parameter2", with: @cancel_condition.parameter2
    fill_in "Probability coefficient", with: @cancel_condition.probability_coefficient
    fill_in "Probability", with: @cancel_condition.probability_id
    click_on "Create Cancel condition"

    assert_text "Cancel condition was successfully created"
    click_on "Back"
  end

  test "updating a Cancel condition" do
    visit cancel_conditions_url
    click_on "Edit", match: :first

    fill_in "Action rule", with: @cancel_condition.action_rule_id
    fill_in "Cancel type", with: @cancel_condition.cancel_type_id
    fill_in "Parameter1", with: @cancel_condition.parameter1
    fill_in "Parameter2", with: @cancel_condition.parameter2
    fill_in "Probability coefficient", with: @cancel_condition.probability_coefficient
    fill_in "Probability", with: @cancel_condition.probability_id
    click_on "Update Cancel condition"

    assert_text "Cancel condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Cancel condition" do
    visit cancel_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cancel condition was successfully destroyed"
  end
end
