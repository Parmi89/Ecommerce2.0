require "test_helper"

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_u = about_us(:one)
  end

  test "should get index" do
    get about_us_url
    assert_response :success
  end

  test "should get new" do
    get new_about_u_url
    assert_response :success
  end

  test "should create about_u" do
    assert_difference("AboutU.count") do
      post about_us_url, params: { about_u: { body: @about_u.body, title: @about_u.title } }
    end

    assert_redirected_to about_u_url(AboutU.last)
  end

  test "should show about_u" do
    get about_u_url(@about_u)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_u_url(@about_u)
    assert_response :success
  end

  test "should update about_u" do
    patch about_u_url(@about_u), params: { about_u: { body: @about_u.body, title: @about_u.title } }
    assert_redirected_to about_u_url(@about_u)
  end

  test "should destroy about_u" do
    assert_difference("AboutU.count", -1) do
      delete about_u_url(@about_u)
    end

    assert_redirected_to about_us_url
  end
end
