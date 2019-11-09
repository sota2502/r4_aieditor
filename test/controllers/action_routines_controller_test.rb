require 'test_helper'

class ActionRoutinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_routine = action_routines(:one)
  end

  test "should get index" do
    get action_routines_url
    assert_response :success
  end

  test "should get new" do
    get new_action_routine_url
    assert_response :success
  end

  test "should create action_routine" do
    assert_difference('ActionRoutine.count') do
      post action_routines_url, params: { action_routine: { action_chain_id: @action_routine.action_chain_id, cancel_type_id: @action_routine.cancel_type_id, hp_condition_id: @action_routine.hp_condition_id, motion_id: @action_routine.motion_id, rate_coefficient: @action_routine.rate_coefficient, rate_id: @action_routine.rate_id, search_id: @action_routine.search_id, target_value: @action_routine.target_value } }
    end

    assert_redirected_to action_routine_url(ActionRoutine.last)
  end

  test "should show action_routine" do
    get action_routine_url(@action_routine)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_routine_url(@action_routine)
    assert_response :success
  end

  test "should update action_routine" do
    patch action_routine_url(@action_routine), params: { action_routine: { action_chain_id: @action_routine.action_chain_id, cancel_type_id: @action_routine.cancel_type_id, hp_condition_id: @action_routine.hp_condition_id, motion_id: @action_routine.motion_id, rate_coefficient: @action_routine.rate_coefficient, rate_id: @action_routine.rate_id, search_id: @action_routine.search_id, target_value: @action_routine.target_value } }
    assert_redirected_to action_routine_url(@action_routine)
  end

  test "should destroy action_routine" do
    assert_difference('ActionRoutine.count', -1) do
      delete action_routine_url(@action_routine)
    end

    assert_redirected_to action_routines_url
  end
end
