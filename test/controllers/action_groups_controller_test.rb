require 'test_helper'

class ActionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_group = action_groups(:one)
  end

  test "should get index" do
    get action_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_action_group_url
    assert_response :success
  end

  test "should create action_group" do
    assert_difference('ActionGroup.count') do
      post action_groups_url, params: { action_group: {  } }
    end

    assert_redirected_to action_group_url(ActionGroup.last)
  end

  test "should show action_group" do
    get action_group_url(@action_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_group_url(@action_group)
    assert_response :success
  end

  test "should update action_group" do
    patch action_group_url(@action_group), params: { action_group: {  } }
    assert_redirected_to action_group_url(@action_group)
  end

  test "should destroy action_group" do
    assert_difference('ActionGroup.count', -1) do
      delete action_group_url(@action_group)
    end

    assert_redirected_to action_groups_url
  end
end
