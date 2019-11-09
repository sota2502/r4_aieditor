require 'test_helper'

class ExactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exaction = exactions(:one)
  end

  test "should get index" do
    get exactions_url
    assert_response :success
  end

  test "should get new" do
    get new_exaction_url
    assert_response :success
  end

  test "should create exaction" do
    assert_difference('Exaction.count') do
      post exactions_url, params: { exaction: { name: @exaction.name, project_id: @exaction.project_id } }
    end

    assert_redirected_to exaction_url(Exaction.last)
  end

  test "should show exaction" do
    get exaction_url(@exaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_exaction_url(@exaction)
    assert_response :success
  end

  test "should update exaction" do
    patch exaction_url(@exaction), params: { exaction: { name: @exaction.name, project_id: @exaction.project_id } }
    assert_redirected_to exaction_url(@exaction)
  end

  test "should destroy exaction" do
    assert_difference('Exaction.count', -1) do
      delete exaction_url(@exaction)
    end

    assert_redirected_to exactions_url
  end
end
