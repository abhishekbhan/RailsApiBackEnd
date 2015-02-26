require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  setup do
    @attraction = attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attractions)
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post :create, attraction: { location: @attraction.location, name: @attraction.name, url: @attraction.url, vacation_id: @attraction.vacation_id }
    end

    assert_response 201
  end

  test "should show attraction" do
    get :show, id: @attraction
    assert_response :success
  end

  test "should update attraction" do
    put :update, id: @attraction, attraction: { location: @attraction.location, name: @attraction.name, url: @attraction.url, vacation_id: @attraction.vacation_id }
    assert_response 204
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete :destroy, id: @attraction
    end

    assert_response 204
  end
end
