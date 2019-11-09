require 'test_helper'

class ActionChainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_chain = action_chains(:one)
  end

  test "should get index" do
    get action_chains_url
    assert_response :success
  end

  test "should get new" do
    get new_action_chain_url
    assert_response :success
  end

  test "should create action_chain" do
    assert_difference('ActionChain.count') do
      post action_chains_url, params: { action_chain: { name: @action_chain.name, project_id: @action_chain.project_id } }
    end

    assert_redirected_to action_chain_url(ActionChain.last)
  end

  test "should show action_chain" do
    get action_chain_url(@action_chain)
    assert_response :success
  end

  test "should get edit" do
    get edit_action_chain_url(@action_chain)
    assert_response :success
  end

  test "should update action_chain" do
    patch action_chain_url(@action_chain), params: { action_chain: { name: @action_chain.name, project_id: @action_chain.project_id } }
    assert_redirected_to action_chain_url(@action_chain)
  end

  test "should destroy action_chain" do
    assert_difference('ActionChain.count', -1) do
      delete action_chain_url(@action_chain)
    end

    assert_redirected_to action_chains_url
  end
end
