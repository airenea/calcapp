require "test_helper"

class LogComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_computation = log_computations(:one)
  end

  test "should get index" do
    get log_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_log_computation_url
    assert_response :success
  end

  test "should create log_computation" do
    assert_difference('LogComputation.count') do
      post log_computations_url, params: { log_computation: { base: @log_computation.base, number: @log_computation.number, result: @log_computation.result } }
    end

    assert_redirected_to log_computation_url(LogComputation.last)
  end

  test "should show log_computation" do
    get log_computation_url(@log_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_computation_url(@log_computation)
    assert_response :success
  end

  test "should update log_computation" do
    patch log_computation_url(@log_computation), params: { log_computation: { base: @log_computation.base, number: @log_computation.number, result: @log_computation.result } }
    assert_redirected_to log_computation_url(@log_computation)
  end

  test "should destroy log_computation" do
    assert_difference('LogComputation.count', -1) do
      delete log_computation_url(@log_computation)
    end

    assert_redirected_to log_computations_url
  end
end
