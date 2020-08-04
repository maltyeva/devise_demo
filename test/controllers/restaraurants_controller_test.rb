require 'test_helper'

class RestaraurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaraurant = restaraurants(:one)
  end

  test "should get index" do
    get restaraurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaraurant_url
    assert_response :success
  end

  test "should create restaraurant" do
    assert_difference('Restaraurant.count') do
      post restaraurants_url, params: { restaraurant: { address: @restaraurant.address, name: @restaraurant.name, user_id: @restaraurant.user_id } }
    end

    assert_redirected_to restaraurant_url(Restaraurant.last)
  end

  test "should show restaraurant" do
    get restaraurant_url(@restaraurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaraurant_url(@restaraurant)
    assert_response :success
  end

  test "should update restaraurant" do
    patch restaraurant_url(@restaraurant), params: { restaraurant: { address: @restaraurant.address, name: @restaraurant.name, user_id: @restaraurant.user_id } }
    assert_redirected_to restaraurant_url(@restaraurant)
  end

  test "should destroy restaraurant" do
    assert_difference('Restaraurant.count', -1) do
      delete restaraurant_url(@restaraurant)
    end

    assert_redirected_to restaraurants_url
  end
end
