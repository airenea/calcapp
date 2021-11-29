require "application_system_test_case"

class SolveComputationsTest < ApplicationSystemTestCase
  setup do
    @solve_computation = solve_computations(:one)
  end

  test "visiting the index" do
    visit solve_computations_url
    assert_selector "h1", text: "Solve Computations"
  end

  test "creating a Solve computation" do
    visit solve_computations_url
    click_on "New Solve Computation"

    fill_in "Left hand", with: @solve_computation.left_hand
    fill_in "Result", with: @solve_computation.result
    fill_in "Right hand", with: @solve_computation.right_hand
    click_on "Create Solve computation"

    assert_text "Solve computation was successfully created"
    click_on "Back"
  end

  test "updating a Solve computation" do
    visit solve_computations_url
    click_on "Edit", match: :first

    fill_in "Left hand", with: @solve_computation.left_hand
    fill_in "Result", with: @solve_computation.result
    fill_in "Right hand", with: @solve_computation.right_hand
    click_on "Update Solve computation"

    assert_text "Solve computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Solve computation" do
    visit solve_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solve computation was successfully destroyed"
  end
end
