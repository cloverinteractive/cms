require 'test_helper'

class Dashboard::PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    assert @user     = Factory.create( :user )
    assert @section  = Factory.create( :section )
    assert @page     = Factory.create( :page, :section => @section )
  end

  test "should get index as admin" do
    login_as @user, :admin

    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should redirect if user is not admin" do
    login_as @user

    get :index
    assert_redirected_to new_user_session_path
  end

  test "should redirect to login if not logged in" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "should get new if admin" do
    login_as @user, :admin

    get :new
    assert_response :success
  end

  test "should not get new if not admin" do
    login_as @user

    get :new
    assert_redirected_to new_user_session_path
  end

  test "should create page if admin" do
    login_as @user, :admin

    assert_difference('Page.count') do
      post :create, :page => Factory.attributes_for(:page, :name => 'newest page', :section => @section)
    end

    assert_redirected_to dashboard_pages_path
  end


  test "shouldn't create page if not admin" do
    post :create, :page => Factory.attributes_for(:page, :name => 'newest page', :section => @section)
    assert_redirected_to new_user_session_path
  end

  test "should get edit if admin" do
    login_as @user, :admin
    get :edit, :id => @page.id
    assert_response :success
  end

  test "should not get edit if not admin" do
    login_as @user
    get :edit, :id => @page.id
    assert_redirected_to new_user_session_path
  end

  test "should update page if admin" do
    login_as @user, :admin

    put :update, :id => @page.id, :page => Factory.attributes_for(:page, :section => @section)
    assert_redirected_to dashboard_pages_path
  end

  test "shouldn't update page if not admin" do
    put :update, :id => @page.id, :page => Factory.attributes_for(:page, :section => @section)
    assert_redirected_to new_user_session_path
  end

  test "should destroy page if admin" do
    login_as @user, :admin

    assert_difference('Page.count', -1) do
      delete :destroy, :id => @page.id
    end

    assert_redirected_to dashboard_pages_path
  end
end
