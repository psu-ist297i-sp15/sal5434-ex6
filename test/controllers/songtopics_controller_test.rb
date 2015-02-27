require 'test_helper'

class SongtopicsControllerTest < ActionController::TestCase
  setup do
    @songtopic = songtopics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songtopics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create songtopic" do
    assert_difference('Songtopic.count') do
      post :create, songtopic: { album: @songtopic.album, name: @songtopic.name }
    end

    assert_redirected_to songtopic_path(assigns(:songtopic))
  end

  test "should show songtopic" do
    get :show, id: @songtopic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @songtopic
    assert_response :success
  end

  test "should update songtopic" do
    patch :update, id: @songtopic, songtopic: { album: @songtopic.album, name: @songtopic.name }
    assert_redirected_to songtopic_path(assigns(:songtopic))
  end

  test "should destroy songtopic" do
    assert_difference('Songtopic.count', -1) do
      delete :destroy, id: @songtopic
    end

    assert_redirected_to songtopics_path
  end
end
