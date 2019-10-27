require 'test_helper'

class ActionStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_state = action_states(:one)
  end

  test "should get index" do
    get action_states_url
    assert_response :success
  end

  test "should get new" do
    get new_action_state_url
    assert_response :success
  end

  test "should create action_state" do
    assert_difference('ActionState.count') do
      post action_states_url, params: { action_state: { chara: @action_state.chara, field: @action_state.field, freq: @action_state.freq, precis: @action_state.precis, project_id: @action_state.project_id } }
    end

    assert_redirected_to action_state_url(ActionState.last)
  end

  test "should show action_state" do
    get action_state_url(@action_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_state_url(@action_state)
    assert_response :success
  end

  test "should update action_state" do
    patch action_state_url(@action_state), params: { action_state: { chara: @action_state.chara, field: @action_state.field, freq: @action_state.freq, precis: @action_state.precis, project_id: @action_state.project_id } }
    assert_redirected_to action_state_url(@action_state)
  end

  test "should destroy action_state" do
    assert_difference('ActionState.count', -1) do
      delete action_state_url(@action_state)
    end

    assert_redirected_to action_states_url
  end
end
