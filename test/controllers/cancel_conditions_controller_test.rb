require 'test_helper'

class CancelConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancel_condition = cancel_conditions(:one)
  end

  test "should get index" do
    get cancel_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_cancel_condition_url
    assert_response :success
  end

  test "should create cancel_condition" do
    assert_difference('CancelCondition.count') do
      post cancel_conditions_url, params: { cancel_condition: { action_rule_id: @cancel_condition.action_rule_id, cancel_type_id: @cancel_condition.cancel_type_id, parameter1: @cancel_condition.parameter1, parameter2: @cancel_condition.parameter2, probability_coefficient: @cancel_condition.probability_coefficient, probability_id: @cancel_condition.probability_id } }
    end

    assert_redirected_to cancel_condition_url(CancelCondition.last)
  end

  test "should show cancel_condition" do
    get cancel_condition_url(@cancel_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_cancel_condition_url(@cancel_condition)
    assert_response :success
  end

  test "should update cancel_condition" do
    patch cancel_condition_url(@cancel_condition), params: { cancel_condition: { action_rule_id: @cancel_condition.action_rule_id, cancel_type_id: @cancel_condition.cancel_type_id, parameter1: @cancel_condition.parameter1, parameter2: @cancel_condition.parameter2, probability_coefficient: @cancel_condition.probability_coefficient, probability_id: @cancel_condition.probability_id } }
    assert_redirected_to cancel_condition_url(@cancel_condition)
  end

  test "should destroy cancel_condition" do
    assert_difference('CancelCondition.count', -1) do
      delete cancel_condition_url(@cancel_condition)
    end

    assert_redirected_to cancel_conditions_url
  end
end
