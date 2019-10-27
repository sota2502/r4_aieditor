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

    fill_in "Action chain", with: @action_rule.action_chain_id
    fill_in "Hold", with: @action_rule.hold
    fill_in "Motion", with: @action_rule.motion_id
    fill_in "Move x", with: @action_rule.move_x
    fill_in "Move y", with: @action_rule.move_y
    fill_in "Next", with: @action_rule.next
    fill_in "Search", with: @action_rule.search_id
    fill_in "Target value", with: @action_rule.target_value
    click_on "Create Action rule"

    assert_text "Action rule was successfully created"
    click_on "Back"
  end

  test "updating a Action rule" do
    visit action_rules_url
    click_on "Edit", match: :first

    fill_in "Action chain", with: @action_rule.action_chain_id
    fill_in "Hold", with: @action_rule.hold
    fill_in "Motion", with: @action_rule.motion_id
    fill_in "Move x", with: @action_rule.move_x
    fill_in "Move y", with: @action_rule.move_y
    fill_in "Next", with: @action_rule.next
    fill_in "Search", with: @action_rule.search_id
    fill_in "Target value", with: @action_rule.target_value
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
