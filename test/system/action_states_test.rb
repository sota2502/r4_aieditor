require "application_system_test_case"

class ActionStatesTest < ApplicationSystemTestCase
  setup do
    @action_state = action_states(:one)
  end

  test "visiting the index" do
    visit action_states_url
    assert_selector "h1", text: "Action States"
  end

  test "creating a Action state" do
    visit action_states_url
    click_on "New Action State"

    fill_in "Chara", with: @action_state.chara
    fill_in "Field", with: @action_state.field
    fill_in "Freq", with: @action_state.freq
    fill_in "Precis", with: @action_state.precis
    fill_in "Project", with: @action_state.project_id
    click_on "Create Action state"

    assert_text "Action state was successfully created"
    click_on "Back"
  end

  test "updating a Action state" do
    visit action_states_url
    click_on "Edit", match: :first

    fill_in "Chara", with: @action_state.chara
    fill_in "Field", with: @action_state.field
    fill_in "Freq", with: @action_state.freq
    fill_in "Precis", with: @action_state.precis
    fill_in "Project", with: @action_state.project_id
    click_on "Update Action state"

    assert_text "Action state was successfully updated"
    click_on "Back"
  end

  test "destroying a Action state" do
    visit action_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action state was successfully destroyed"
  end
end
