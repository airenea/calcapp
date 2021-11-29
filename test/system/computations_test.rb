require "application_system_test_case"

class ComputationsTest < ApplicationSystemTestCase
  setup do
    @computation = computations(:one)
  end

  test "visiting the index" do
    visit computations_url
    assert_selector "h1", text: "Computations"
  end

  test "creating a Computation" do
    visit computations_url
    click_on "New Computation"

    fill_in "Expression", with: @computation.expression
    fill_in "Function", with: @computation.function
    click_on "Create Computation"

    assert_text "Computation was successfully created"
    click_on "Back"
  end

  test "updating a Computation" do
    visit computations_url
    click_on "Edit", match: :first

    fill_in "Expression", with: @computation.expression
    fill_in "Function", with: @computation.function
    click_on "Update Computation"

    assert_text "Computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Computation" do
    visit computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Computation was successfully destroyed"
  end
end
