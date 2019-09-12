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
      post action_rules_url, params: { action_rule: { action_group_id: @action_rule.action_group_id, action_type_id: @action_rule.action_type_id, holding_time: @action_rule.holding_time, name: @action_rule.name, next_act_timing_id: @action_rule.next_act_timing_id, velocity_x: @action_rule.velocity_x, velocity_y: @action_rule.velocity_y } }
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
    patch action_rule_url(@action_rule), params: { action_rule: { action_group_id: @action_rule.action_group_id, action_type_id: @action_rule.action_type_id, holding_time: @action_rule.holding_time, name: @action_rule.name, next_act_timing_id: @action_rule.next_act_timing_id, velocity_x: @action_rule.velocity_x, velocity_y: @action_rule.velocity_y } }
    assert_redirected_to action_rule_url(@action_rule)
  end

  test "should destroy action_rule" do
    assert_difference('ActionRule.count', -1) do
      delete action_rule_url(@action_rule)
    end

    assert_redirected_to action_rules_url
  end
end
