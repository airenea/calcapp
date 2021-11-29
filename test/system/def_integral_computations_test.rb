require "application_system_test_case"

class DefIntegralComputationsTest < ApplicationSystemTestCase
  setup do
    @def_integral_computation = def_integral_computations(:one)
  end

  test "visiting the index" do
    visit def_integral_computations_url
    assert_selector "h1", text: "Def Integral Computations"
  end

  test "creating a Def integral computation" do
    visit def_integral_computations_url
    click_on "New Def Integral Computation"

    fill_in "Expression", with: @def_integral_computation.expression
    fill_in "Lower bound", with: @def_integral_computation.lower_bound
    fill_in "Result", with: @def_integral_computation.result
    fill_in "Upper bound", with: @def_integral_computation.upper_bound
    click_on "Create Def integral computation"

    assert_text "Def integral computation was successfully created"
    click_on "Back"
  end

  test "updating a Def integral computation" do
    visit def_integral_computations_url
    click_on "Edit", match: :first

    fill_in "Expression", with: @def_integral_computation.expression
    fill_in "Lower bound", with: @def_integral_computation.lower_bound
    fill_in "Result", with: @def_integral_computation.result
    fill_in "Upper bound", with: @def_integral_computation.upper_bound
    click_on "Update Def integral computation"

    assert_text "Def integral computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Def integral computation" do
    visit def_integral_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Def integral computation was successfully destroyed"
  end
end
