require "application_system_test_case"

class TangentComputationsTest < ApplicationSystemTestCase
  setup do
    @tangent_computation = tangent_computations(:one)
  end

  test "visiting the index" do
    visit tangent_computations_url
    assert_selector "h1", text: "Tangent Computations"
  end

  test "creating a Tangent computation" do
    visit tangent_computations_url
    click_on "New Tangent Computation"

    fill_in "Expression", with: @tangent_computation.expression
    fill_in "Point", with: @tangent_computation.point
    fill_in "Result", with: @tangent_computation.result
    click_on "Create Tangent computation"

    assert_text "Tangent computation was successfully created"
    click_on "Back"
  end

  test "updating a Tangent computation" do
    visit tangent_computations_url
    click_on "Edit", match: :first

    fill_in "Expression", with: @tangent_computation.expression
    fill_in "Point", with: @tangent_computation.point
    fill_in "Result", with: @tangent_computation.result
    click_on "Update Tangent computation"

    assert_text "Tangent computation was successfully updated"
    click_on "Back"
  end

  test "destroying a Tangent computation" do
    visit tangent_computations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tangent computation was successfully destroyed"
  end
end
