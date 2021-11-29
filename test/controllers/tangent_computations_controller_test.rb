require "test_helper"

class TangentComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tangent_computation = tangent_computations(:one)
  end

  test "should get index" do
    get tangent_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_tangent_computation_url
    assert_response :success
  end

  test "should create tangent_computation" do
    assert_difference('TangentComputation.count') do
      post tangent_computations_url, params: { tangent_computation: { expression: @tangent_computation.expression, point: @tangent_computation.point, result: @tangent_computation.result } }
    end

    assert_redirected_to tangent_computation_url(TangentComputation.last)
  end

  test "should show tangent_computation" do
    get tangent_computation_url(@tangent_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_tangent_computation_url(@tangent_computation)
    assert_response :success
  end

  test "should update tangent_computation" do
    patch tangent_computation_url(@tangent_computation), params: { tangent_computation: { expression: @tangent_computation.expression, point: @tangent_computation.point, result: @tangent_computation.result } }
    assert_redirected_to tangent_computation_url(@tangent_computation)
  end

  test "should destroy tangent_computation" do
    assert_difference('TangentComputation.count', -1) do
      delete tangent_computation_url(@tangent_computation)
    end

    assert_redirected_to tangent_computations_url
  end
end
