require "application_system_test_case"

class AiRoutinesTest < ApplicationSystemTestCase
  setup do
    @ai_routine = ai_routines(:one)
  end

  test "visiting the index" do
    visit ai_routines_url
    assert_selector "h1", text: "Ai Routines"
  end

  test "creating a Ai routine" do
    visit ai_routines_url
    click_on "New Ai Routine"

    fill_in "Name", with: @ai_routine.name
    click_on "Create Ai routine"

    assert_text "Ai routine was successfully created"
    click_on "Back"
  end

  test "updating a Ai routine" do
    visit ai_routines_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ai_routine.name
    click_on "Update Ai routine"

    assert_text "Ai routine was successfully updated"
    click_on "Back"
  end

  test "destroying a Ai routine" do
    visit ai_routines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ai routine was successfully destroyed"
  end
end
