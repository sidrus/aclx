require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { comments: @user.comments, date_joined: @user.date_joined, email: @user.email, forum_name: @user.forum_name, full_name: @user.full_name, has_facebook: @user.has_facebook, id: @user.id, id_issued: @user.id_issued, last_activity: @user.last_activity, vehicle_desc: @user.vehicle_desc } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { comments: @user.comments, date_joined: @user.date_joined, email: @user.email, forum_name: @user.forum_name, full_name: @user.full_name, has_facebook: @user.has_facebook, id: @user.id, id_issued: @user.id_issued, last_activity: @user.last_activity, vehicle_desc: @user.vehicle_desc } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
