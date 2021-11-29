require "application_system_test_case"

class ZeroesComputationsTest < ApplicationSystemTestCase
  setup do
    @zeroes_computation = zeroes_computations(:one)
  end

  test "visiting the index" do
    visit zeroes_computations_url
    assert_selector "h1", text: "Zeroes Computations"
  end

  test "creating a Zeroes computation" do
    visit zeroes_computations_url
    click_on "New Zeroes Computation"

    fill_in "Expression", with: @zeroes_computation.expression
    fill_in "Result", with: @zeroes_computation.result
    click_on "Create Zeroes computation"

    assert_text "Zeroes computation was successfully created"
    click_on "Back"
  end

  test "updating a Zeroes computation" do
    visit zeroes_computations_url
    click_on "Edit", match: :first

    fill_in "Expression", with: @zeroes_computation.expression
    fill_in "Result", with: @zeroes_computation.result
    click_on "Update Zeroes computation"

    assert_text "Zeroes computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Zeroes computation" do
    visit zeroes_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Zeroes computation was successfully destroyed"
  end
end
