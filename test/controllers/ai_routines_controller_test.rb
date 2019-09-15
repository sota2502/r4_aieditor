require 'test_helper'

class AiRoutinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_routine = ai_routines(:one)
  end

  test "should get index" do
    get ai_routines_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_routine_url
    assert_response :success
  end

  test "should create ai_routine" do
    assert_difference('AiRoutine.count') do
      post ai_routines_url, params: { ai_routine: { name: @ai_routine.name } }
    end

    assert_redirected_to ai_routine_url(AiRoutine.last)
  end

  test "should show ai_routine" do
    get ai_routine_url(@ai_routine)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_routine_url(@ai_routine)
    assert_response :success
  end

  test "should update ai_routine" do
    patch ai_routine_url(@ai_routine), params: { ai_routine: { name: @ai_routine.name } }
    assert_redirected_to ai_routine_url(@ai_routine)
  end

  test "should destroy ai_routine" do
    assert_difference('AiRoutine.count', -1) do
      delete ai_routine_url(@ai_routine)
    end

    assert_redirected_to ai_routines_url
  end
end
