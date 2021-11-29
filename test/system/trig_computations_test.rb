require "application_system_test_case"

class TrigComputationsTest < ApplicationSystemTestCase
  setup do
    @trig_computation = trig_computations(:one)
  end

  test "visiting the index" do
    visit trig_computations_url
    assert_selector "h1", text: "Trig Computations"
  end

  test "creating a Trig computation" do
    visit trig_computations_url
    click_on "New Trig Computation"

    fill_in "Expression", with: @trig_computation.expression
    fill_in "Function", with: @trig_computation.function
    check "Radians" if @trig_computation.radians
    click_on "Create Trig computation"

    assert_text "Trig computation was successfully created"
    click_on "Back"
  end

  test "updating a Trig computation" do
    visit trig_computations_url
    click_on "Edit", match: :first

    fill_in "Expression", with: @trig_computation.expression
    fill_in "Function", with: @trig_computation.function
    check "Radians" if @trig_computation.radians
    click_on "Update Trig computation"

    assert_text "Trig computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Trig computation" do
    visit trig_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trig computation was successfully destroyed"
  end
end
