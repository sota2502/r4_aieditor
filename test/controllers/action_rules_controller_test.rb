require 'test_helper'

class ActionRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_rule = action_rules(:one)
  end

  test "should get index" do
    get action_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_action_rule_url
    assert_response :success
  end

  test "should create action_rule" do
    assert_difference('ActionRule.count') do
      post action_rules_url, params: { action_rule: { action_chain_id: @action_rule.action_chain_id, hold: @action_rule.hold, motion_id: @action_rule.motion_id, move_x: @action_rule.move_x, move_y: @action_rule.move_y, next: @action_rule.next, search_id: @action_rule.search_id, target_value: @action_rule.target_value } }
    end

    assert_redirected_to action_rule_url(ActionRule.last)
  end

  test "should show action_rule" do
    get action_rule_url(@action_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_rule_url(@action_rule)
    assert_response :success
  end

  test "should update action_rule" do
    patch action_rule_url(@action_rule), params: { action_rule: { action_chain_id: @action_rule.action_chain_id, hold: @action_rule.hold, motion_id: @action_rule.motion_id, move_x: @action_rule.move_x, move_y: @action_rule.move_y, next: @action_rule.next, search_id: @action_rule.search_id, target_value: @action_rule.target_value } }
    assert_redirected_to action_rule_url(@action_rule)
  end

  test "should destroy action_rule" do
    assert_difference('ActionRule.count', -1) do
      delete action_rule_url(@action_rule)
    end

    assert_redirected_to action_rules_url
  end
end
