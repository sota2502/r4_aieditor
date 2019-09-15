require 'test_helper'

class TargetActionConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target_action_condition = target_action_conditions(:one)
  end

  test "should get index" do
    get target_action_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_target_action_condition_url
    assert_response :success
  end

  test "should create target_action_condition" do
    assert_difference('TargetActionCondition.count') do
      post target_action_conditions_url, params: { target_action_condition: { action_group_id: @target_action_condition.action_group_id, hp_condition_id: @target_action_condition.hp_condition_id, previous_cancel_type: @target_action_condition.previous_cancel_type, probability_coefficient: @target_action_condition.probability_coefficient, probability_id: @target_action_condition.probability_id, search_range_id: @target_action_condition.search_range_id, target_motion_id: @target_action_condition.target_motion_id, target_type_id: @target_action_condition.target_type_id } }
    end

    assert_redirected_to target_action_condition_url(TargetActionCondition.last)
  end

  test "should show target_action_condition" do
    get target_action_condition_url(@target_action_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_target_action_condition_url(@target_action_condition)
    assert_response :success
  end

  test "should update target_action_condition" do
    patch target_action_condition_url(@target_action_condition), params: { target_action_condition: { action_group_id: @target_action_condition.action_group_id, hp_condition_id: @target_action_condition.hp_condition_id, previous_cancel_type: @target_action_condition.previous_cancel_type, probability_coefficient: @target_action_condition.probability_coefficient, probability_id: @target_action_condition.probability_id, search_range_id: @target_action_condition.search_range_id, target_motion_id: @target_action_condition.target_motion_id, target_type_id: @target_action_condition.target_type_id } }
    assert_redirected_to target_action_condition_url(@target_action_condition)
  end

  test "should destroy target_action_condition" do
    assert_difference('TargetActionCondition.count', -1) do
      delete target_action_condition_url(@target_action_condition)
    end

    assert_redirected_to target_action_conditions_url
  end
end
