require "test_helper"

class InfoUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_user = info_users(:one)
  end

  test "should get index" do
    get info_users_url
    assert_response :success
  end

  test "should get new" do
    get new_info_user_url
    assert_response :success
  end

  test "should create info_user" do
    assert_difference("InfoUser.count") do
      post info_users_url, params: { info_user: { cell: @info_user.cell, first_name: @info_user.first_name, last_name: @info_user.last_name, location: @info_user.location, number: @info_user.number, province: @info_user.province, street: @info_user.street, user_id: @info_user.user_id } }
    end

    assert_redirected_to info_user_url(InfoUser.last)
  end

  test "should show info_user" do
    get info_user_url(@info_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_user_url(@info_user)
    assert_response :success
  end

  test "should update info_user" do
    patch info_user_url(@info_user), params: { info_user: { cell: @info_user.cell, first_name: @info_user.first_name, last_name: @info_user.last_name, location: @info_user.location, number: @info_user.number, province: @info_user.province, street: @info_user.street, user_id: @info_user.user_id } }
    assert_redirected_to info_user_url(@info_user)
  end

  test "should destroy info_user" do
    assert_difference("InfoUser.count", -1) do
      delete info_user_url(@info_user)
    end

    assert_redirected_to info_users_url
  end
end
