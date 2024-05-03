require "test_helper"

class GenerationalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generational = generationals(:one)
  end

  test "should get index" do
    get generationals_url
    assert_response :success
  end

  test "should get new" do
    get new_generational_url
    assert_response :success
  end

  test "should create generational" do
    assert_difference("Generational.count") do
      post generationals_url, params: { generational: { name: @generational.name } }
    end

    assert_redirected_to generational_url(Generational.last)
  end

  test "should show generational" do
    get generational_url(@generational)
    assert_response :success
  end

  test "should get edit" do
    get edit_generational_url(@generational)
    assert_response :success
  end

  test "should update generational" do
    patch generational_url(@generational), params: { generational: { name: @generational.name } }
    assert_redirected_to generational_url(@generational)
  end

  test "should destroy generational" do
    assert_difference("Generational.count", -1) do
      delete generational_url(@generational)
    end

    assert_redirected_to generationals_url
  end
end
