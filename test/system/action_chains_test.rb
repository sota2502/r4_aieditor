require "application_system_test_case"

class ActionChainsTest < ApplicationSystemTestCase
  setup do
    @action_chain = action_chains(:one)
  end

  test "visiting the index" do
    visit action_chains_url
    assert_selector "h1", text: "Action Chains"
  end

  test "creating a Action chain" do
    visit action_chains_url
    click_on "New Action Chain"

    fill_in "Name", with: @action_chain.name
    fill_in "Project", with: @action_chain.project_id
    click_on "Create Action chain"

    assert_text "Action chain was successfully created"
    click_on "Back"
  end

  test "updating a Action chain" do
    visit action_chains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @action_chain.name
    fill_in "Project", with: @action_chain.project_id
    click_on "Update Action chain"

    assert_text "Action chain was successfully updated"
    click_on "Back"
  end

  test "destroying a Action chain" do
    visit action_chains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action chain was successfully destroyed"
  end
end
