require "application_system_test_case"

class ActionGroupsTest < ApplicationSystemTestCase
  setup do
    @action_group = action_groups(:one)
  end

  test "visiting the index" do
    visit action_groups_url
    assert_selector "h1", text: "Action Groups"
  end

  test "creating a Action group" do
    visit action_groups_url
    click_on "New Action Group"

    click_on "Create Action group"

    assert_text "Action group was successfully created"
    click_on "Back"
  end

  test "updating a Action group" do
    visit action_groups_url
    click_on "Edit", match: :first

    click_on "Update Action group"

    assert_text "Action group was successfully updated"
    click_on "Back"
  end

  test "destroying a Action group" do
    visit action_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action group was successfully destroyed"
  end
end
