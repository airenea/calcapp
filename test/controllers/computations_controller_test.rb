require "test_helper"

class ComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computation = computations(:one)
  end

  test "should get index" do
    get computations_url
    assert_response :success
  end

  test "should get new" do
    get new_computation_url
    assert_response :success
  end

  test "should create computation" do
    assert_difference('Computation.count') do
      post computations_url, params: { computation: { expression: @computation.expression, function: @computation.function } }
    end

    assert_redirected_to computation_url(Computation.last)
  end

  test "should show computation" do
    get computation_url(@computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_computation_url(@computation)
    assert_response :success
  end

  test "should update computation" do
    patch computation_url(@computation), params: { computation: { expression: @computation.expression, function: @computation.function } }
    assert_redirected_to computation_url(@computation)
  end

  test "should destroy computation" do
    assert_difference('Computation.count', -1) do
      delete computation_url(@computation)
    end

    assert_redirected_to computations_url
  end
end
