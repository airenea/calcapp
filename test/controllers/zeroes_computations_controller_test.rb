require "test_helper"

class ZeroesComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zeroes_computation = zeroes_computations(:one)
  end

  test "should get index" do
    get zeroes_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_zeroes_computation_url
    assert_response :success
  end

  test "should create zeroes_computation" do
    assert_difference('ZeroesComputation.count') do
      post zeroes_computations_url, params: { zeroes_computation: { expression: @zeroes_computation.expression, result: @zeroes_computation.result } }
    end

    assert_redirected_to zeroes_computation_url(ZeroesComputation.last)
  end

  test "should show zeroes_computation" do
    get zeroes_computation_url(@zeroes_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_zeroes_computation_url(@zeroes_computation)
    assert_response :success
  end

  test "should update zeroes_computation" do
    patch zeroes_computation_url(@zeroes_computation), params: { zeroes_computation: { expression: @zeroes_computation.expression, result: @zeroes_computation.result } }
    assert_redirected_to zeroes_computation_url(@zeroes_computation)
  end

  test "should destroy zeroes_computation" do
    assert_difference('ZeroesComputation.count', -1) do
      delete zeroes_computation_url(@zeroes_computation)
    end

    assert_redirected_to zeroes_computations_url
  end
end
