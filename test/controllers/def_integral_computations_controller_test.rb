require "test_helper"

class DefIntegralComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @def_integral_computation = def_integral_computations(:one)
  end

  test "should get index" do
    get def_integral_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_def_integral_computation_url
    assert_response :success
  end

  test "should create def_integral_computation" do
    assert_difference('DefIntegralComputation.count') do
      post def_integral_computations_url, params: { def_integral_computation: { expression: @def_integral_computation.expression, lower_bound: @def_integral_computation.lower_bound, result: @def_integral_computation.result, upper_bound: @def_integral_computation.upper_bound } }
    end

    assert_redirected_to def_integral_computation_url(DefIntegralComputation.last)
  end

  test "should show def_integral_computation" do
    get def_integral_computation_url(@def_integral_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_def_integral_computation_url(@def_integral_computation)
    assert_response :success
  end

  test "should update def_integral_computation" do
    patch def_integral_computation_url(@def_integral_computation), params: { def_integral_computation: { expression: @def_integral_computation.expression, lower_bound: @def_integral_computation.lower_bound, result: @def_integral_computation.result, upper_bound: @def_integral_computation.upper_bound } }
    assert_redirected_to def_integral_computation_url(@def_integral_computation)
  end

  test "should destroy def_integral_computation" do
    assert_difference('DefIntegralComputation.count', -1) do
      delete def_integral_computation_url(@def_integral_computation)
    end

    assert_redirected_to def_integral_computations_url
  end
end
