require "application_system_test_case"

class ActionRoutinesTest < ApplicationSystemTestCase
  setup do
    @action_routine = action_routines(:one)
  end

  test "visiting the index" do
    visit action_routines_url
    assert_selector "h1", text: "Action Routines"
  end

  test "creating a Action routine" do
    visit action_routines_url
    click_on "New Action Routine"

    fill_in "Action chain", with: @action_routine.action_chain_id
    fill_in "Cancel type", with: @action_routine.cancel_type_id
    fill_in "Hp condition", with: @action_routine.hp_condition_id
    fill_in "Motion", with: @action_routine.motion_id
    fill_in "Rate coefficient", with: @action_routine.rate_coefficient
    fill_in "Rate", with: @action_routine.rate_id
    fill_in "Search", with: @action_routine.search_id
    fill_in "Target value", with: @action_routine.target_value
    click_on "Create Action routine"

    assert_text "Action routine was successfully created"
    click_on "Back"
  end

  test "updating a Action routine" do
    visit action_routines_url
    click_on "Edit", match: :first

    fill_in "Action chain", with: @action_routine.action_chain_id
    fill_in "Cancel type", with: @action_routine.cancel_type_id
    fill_in "Hp condition", with: @action_routine.hp_condition_id
    fill_in "Motion", with: @action_routine.motion_id
    fill_in "Rate coefficient", with: @action_routine.rate_coefficient
    fill_in "Rate", with: @action_routine.rate_id
    fill_in "Search", with: @action_routine.search_id
    fill_in "Target value", with: @action_routine.target_value
    click_on "Update Action routine"

    assert_text "Action routine was successfully updated"
    click_on "Back"
  end

  test "destroying a Action routine" do
    visit action_routines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action routine was successfully destroyed"
  end
end
