require 'test_helper'

class SearchRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_range = search_ranges(:one)
  end

  test "should get index" do
    get search_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_search_range_url
    assert_response :success
  end

  test "should create search_range" do
    assert_difference('SearchRange.count') do
      post search_ranges_url, params: { search_range: {  } }
    end

    assert_redirected_to search_range_url(SearchRange.last)
  end

  test "should show search_range" do
    get search_range_url(@search_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_range_url(@search_range)
    assert_response :success
  end

  test "should update search_range" do
    patch search_range_url(@search_range), params: { search_range: {  } }
    assert_redirected_to search_range_url(@search_range)
  end

  test "should destroy search_range" do
    assert_difference('SearchRange.count', -1) do
      delete search_range_url(@search_range)
    end

    assert_redirected_to search_ranges_url
  end
end
