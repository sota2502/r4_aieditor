require "application_system_test_case"

class ActionRulesTest < ApplicationSystemTestCase
  setup do
    @action_rule = action_rules(:one)
  end

  test "visiting the index" do
    visit action_rules_url
    assert_selector "h1", text: "Action Rules"
  end

  test "creating a Action rule" do
    visit action_rules_url
    click_on "New Action Rule"

    fill_in "Action group", with: @action_rule.action_group_id
    fill_in "Action type", with: @action_rule.action_type_id
    fill_in "Holding time", with: @action_rule.holding_time
    fill_in "Name", with: @action_rule.name
    fill_in "Next act timing", with: @action_rule.next_act_timing_id
    fill_in "Velocity x", with: @action_rule.velocity_x
    fill_in "Velocity y", with: @action_rule.velocity_y
    click_on "Create Action rule"

    assert_text "Action rule was successfully created"
    click_on "Back"
  end

  test "updating a Action rule" do
    visit action_rules_url
    click_on "Edit", match: :first

    fill_in "Action group", with: @action_rule.action_group_id
    fill_in "Action type", with: @action_rule.action_type_id
    fill_in "Holding time", with: @action_rule.holding_time
    fill_in "Name", with: @action_rule.name
    fill_in "Next act timing", with: @action_rule.next_act_timing_id
    fill_in "Velocity x", with: @action_rule.velocity_x
    fill_in "Velocity y", with: @action_rule.velocity_y
    click_on "Update Action rule"

    assert_text "Action rule was successfully updated"
    click_on "Back"
  end

  test "destroying a Action rule" do
    visit action_rules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action rule was successfully destroyed"
  end
end
