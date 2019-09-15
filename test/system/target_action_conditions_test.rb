require "application_system_test_case"

class TargetActionConditionsTest < ApplicationSystemTestCase
  setup do
    @target_action_condition = target_action_conditions(:one)
  end

  test "visiting the index" do
    visit target_action_conditions_url
    assert_selector "h1", text: "Targe Action Conditions"
  end

  test "creating a Targe action condition" do
    visit target_action_conditions_url
    click_on "New Targe Action Condition"

    fill_in "Action group", with: @target_action_condition.action_group_id
    fill_in "Hp condition", with: @target_action_condition.hp_condition_id
    fill_in "Previous cancel type", with: @target_action_condition.previous_cancel_type
    fill_in "Probability coefficient", with: @target_action_condition.probability_coefficient
    fill_in "Probability", with: @target_action_condition.probability_id
    fill_in "Search range", with: @target_action_condition.search_range_id
    fill_in "Target motion", with: @target_action_condition.target_motion_id
    fill_in "Target type", with: @target_action_condition.target_type_id
    click_on "Create Targe action condition"

    assert_text "Targe action condition was successfully created"
    click_on "Back"
  end

  test "updating a Targe action condition" do
    visit target_action_conditions_url
    click_on "Edit", match: :first

    fill_in "Action group", with: @target_action_condition.action_group_id
    fill_in "Hp condition", with: @target_action_condition.hp_condition_id
    fill_in "Previous cancel type", with: @target_action_condition.previous_cancel_type
    fill_in "Probability coefficient", with: @target_action_condition.probability_coefficient
    fill_in "Probability", with: @target_action_condition.probability_id
    fill_in "Search range", with: @target_action_condition.search_range_id
    fill_in "Target motion", with: @target_action_condition.target_motion_id
    fill_in "Target type", with: @target_action_condition.target_type_id
    click_on "Update Targe action condition"

    assert_text "Targe action condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Targe action condition" do
    visit target_action_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Targe action condition was successfully destroyed"
  end
end
