require 'test_helper'

class ProbabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @probability = probabilities(:one)
  end

  test "should get index" do
    get probabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_probability_url
    assert_response :success
  end

  test "should create probability" do
    assert_difference('Probability.count') do
      post probabilities_url, params: { probability: {  } }
    end

    assert_redirected_to probability_url(Probability.last)
  end

  test "should show probability" do
    get probability_url(@probability)
    assert_response :success
  end

  test "should get edit" do
    get edit_probability_url(@probability)
    assert_response :success
  end

  test "should update probability" do
    patch probability_url(@probability), params: { probability: {  } }
    assert_redirected_to probability_url(@probability)
  end

  test "should destroy probability" do
    assert_difference('Probability.count', -1) do
      delete probability_url(@probability)
    end

    assert_redirected_to probabilities_url
  end
end
