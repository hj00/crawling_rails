require 'test_helper'

class CrasControllerTest < ActionController::TestCase
  setup do
    @cra = cras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cra" do
    assert_difference('Cra.count') do
      post :create, cra: { urlad: @cra.urlad, words: @cra.words }
    end

    assert_redirected_to cra_path(assigns(:cra))
  end

  test "should show cra" do
    get :show, id: @cra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cra
    assert_response :success
  end

  test "should update cra" do
    patch :update, id: @cra, cra: { urlad: @cra.urlad, words: @cra.words }
    assert_redirected_to cra_path(assigns(:cra))
  end

  test "should destroy cra" do
    assert_difference('Cra.count', -1) do
      delete :destroy, id: @cra
    end

    assert_redirected_to cras_path
  end
end
