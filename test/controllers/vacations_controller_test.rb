require 'test_helper'

class VacationsControllerTest < ActionController::TestCase
  setup do
    @vacation = vacations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacations)
  end

  test "should create vacation" do
    assert_difference('Vacation.count') do
      post :create, vacation: { description: @vacation.description, name: @vacation.name, user_id: @vacation.user_id }
    end

    assert_response 201
  end

  test "should show vacation" do
    get :show, id: @vacation
    assert_response :success
  end

  test "should update vacation" do
    put :update, id: @vacation, vacation: { description: @vacation.description, name: @vacation.name, user_id: @vacation.user_id }
    assert_response 204
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete :destroy, id: @vacation
    end

    assert_response 204
  end
end
