require "test_helper"

class TrigComputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trig_computation = trig_computations(:one)
  end

  test "should get index" do
    get trig_computations_url
    assert_response :success
  end

  test "should get new" do
    get new_trig_computation_url
    assert_response :success
  end

  test "should create trig_computation" do
    assert_difference('TrigComputation.count') do
      post trig_computations_url, params: { trig_computation: { expression: @trig_computation.expression, function: @trig_computation.function, radians: @trig_computation.radians } }
    end

    assert_redirected_to trig_computation_url(TrigComputation.last)
  end

  test "should show trig_computation" do
    get trig_computation_url(@trig_computation)
    assert_response :success
  end

  test "should get edit" do
    get edit_trig_computation_url(@trig_computation)
    assert_response :success
  end

  test "should update trig_computation" do
    patch trig_computation_url(@trig_computation), params: { trig_computation: { expression: @trig_computation.expression, function: @trig_computation.function, radians: @trig_computation.radians } }
    assert_redirected_to trig_computation_url(@trig_computation)
  end

  test "should destroy trig_computation" do
    assert_difference('TrigComputation.count', -1) do
      delete trig_computation_url(@trig_computation)
    end

    assert_redirected_to trig_computations_url
  end
end
