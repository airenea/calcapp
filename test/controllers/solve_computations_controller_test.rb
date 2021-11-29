require "test_helper"

class SolveComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solve_computation = solve_computations(:one)
  end

  test "should get index" do
    get solve_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_solve_computation_url
    assert_response :success
  end

  test "should create solve_computation" do
    assert_difference('SolveComputation.count') do
      post solve_computations_url, params: { solve_computation: { left_hand: @solve_computation.left_hand, result: @solve_computation.result, right_hand: @solve_computation.right_hand } }
    end

    assert_redirected_to solve_computation_url(SolveComputation.last)
  end

  test "should show solve_computation" do
    get solve_computation_url(@solve_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_solve_computation_url(@solve_computation)
    assert_response :success
  end

  test "should update solve_computation" do
    patch solve_computation_url(@solve_computation), params: { solve_computation: { left_hand: @solve_computation.left_hand, result: @solve_computation.result, right_hand: @solve_computation.right_hand } }
    assert_redirected_to solve_computation_url(@solve_computation)
  end

  test "should destroy solve_computation" do
    assert_difference('SolveComputation.count', -1) do
      delete solve_computation_url(@solve_computation)
    end

    assert_redirected_to solve_computations_url
  end
end
