require "application_system_test_case"

class InfoUsersTest < ApplicationSystemTestCase
  setup do
    @info_user = info_users(:one)
  end

  test "visiting the index" do
    visit info_users_url
    assert_selector "h1", text: "Info users"
  end

  test "should create info user" do
    visit info_users_url
    click_on "New info user"

    fill_in "Cell", with: @info_user.cell
    fill_in "First name", with: @info_user.first_name
    fill_in "Last name", with: @info_user.last_name
    fill_in "Location", with: @info_user.location
    fill_in "Number", with: @info_user.number
    fill_in "Province", with: @info_user.province
    fill_in "Street", with: @info_user.street
    fill_in "User", with: @info_user.user_id
    click_on "Create Info user"

    assert_text "Info user was successfully created"
    click_on "Back"
  end

  test "should update Info user" do
    visit info_user_url(@info_user)
    click_on "Edit this info user", match: :first

    fill_in "Cell", with: @info_user.cell
    fill_in "First name", with: @info_user.first_name
    fill_in "Last name", with: @info_user.last_name
    fill_in "Location", with: @info_user.location
    fill_in "Number", with: @info_user.number
    fill_in "Province", with: @info_user.province
    fill_in "Street", with: @info_user.street
    fill_in "User", with: @info_user.user_id
    click_on "Update Info user"

    assert_text "Info user was successfully updated"
    click_on "Back"
  end

  test "should destroy Info user" do
    visit info_user_url(@info_user)
    click_on "Destroy this info user", match: :first

    assert_text "Info user was successfully destroyed"
  end
end
