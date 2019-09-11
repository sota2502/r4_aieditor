require "application_system_test_case"

class SearchRangesTest < ApplicationSystemTestCase
  setup do
    @search_range = search_ranges(:one)
  end

  test "visiting the index" do
    visit search_ranges_url
    assert_selector "h1", text: "サーチレンジs"
  end

  test "creating a Search range" do
    visit search_ranges_url
    click_on "サーチレンジの新規作成"

    click_on "Create Search range"

    assert_text "Search range was successfully created"
    click_on "Back"
  end

  test "updating a Search range" do
    visit search_ranges_url
    click_on "Edit", match: :first

    click_on "Update Search range"

    assert_text "Search range was successfully updated"
    click_on "Back"
  end

  test "destroying a Search range" do
    visit search_ranges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search range was successfully destroyed"
  end
end
