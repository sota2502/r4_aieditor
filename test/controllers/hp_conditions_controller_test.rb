require 'test_helper'

class HpConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hp_condition = hp_conditions(:one)
  end

  test "should get index" do
    get hp_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_hp_condition_url
    assert_response :success
  end

  test "should create hp_condition" do
    assert_difference('HpCondition.count') do
      post hp_conditions_url, params: { hp_condition: { exaction_id: @hp_condition.exaction_id, value: @hp_condition.value } }
    end

    assert_redirected_to hp_condition_url(HpCondition.last)
  end

  test "should show hp_condition" do
    get hp_condition_url(@hp_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_hp_condition_url(@hp_condition)
    assert_response :success
  end

  test "should update hp_condition" do
    patch hp_condition_url(@hp_condition), params: { hp_condition: { exaction_id: @hp_condition.exaction_id, value: @hp_condition.value } }
    assert_redirected_to hp_condition_url(@hp_condition)
  end

  test "should destroy hp_condition" do
    assert_difference('HpCondition.count', -1) do
      delete hp_condition_url(@hp_condition)
    end

    assert_redirected_to hp_conditions_url
  end
end
