require "application_system_test_case"

class LogComputationsTest < ApplicationSystemTestCase
  setup do
    @log_computation = log_computations(:one)
  end

  test "visiting the index" do
    visit log_computations_url
    assert_selector "h1", text: "Log Computations"
  end

  test "creating a Log computation" do
    visit log_computations_url
    click_on "New Log Computation"

    fill_in "Base", with: @log_computation.base
    fill_in "Number", with: @log_computation.number
    fill_in "Result", with: @log_computation.result
    click_on "Create Log computation"

    assert_text "Log computation was successfully created"
    click_on "Back"
  end

  test "updating a Log computation" do
    visit log_computations_url
    click_on "Edit", match: :first

    fill_in "Base", with: @log_computation.base
    fill_in "Number", with: @log_computation.number
    fill_in "Result", with: @log_computation.result
    click_on "Update Log computation"

    assert_text "Log computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Log computation" do
    visit log_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log computation was successfully destroyed"
  end
end
