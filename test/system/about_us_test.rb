require "application_system_test_case"

class AboutUsTest < ApplicationSystemTestCase
  setup do
    @about_u = about_us(:one)
  end

  test "visiting the index" do
    visit about_us_url
    assert_selector "h1", text: "About us"
  end

  test "should create about u" do
    visit about_us_url
    click_on "New about u"

    fill_in "Body", with: @about_u.body
    fill_in "Title", with: @about_u.title
    click_on "Create About u"

    assert_text "About u was successfully created"
    click_on "Back"
  end

  test "should update About u" do
    visit about_u_url(@about_u)
    click_on "Edit this about u", match: :first

    fill_in "Body", with: @about_u.body
    fill_in "Title", with: @about_u.title
    click_on "Update About u"

    assert_text "About u was successfully updated"
    click_on "Back"
  end

  test "should destroy About u" do
    visit about_u_url(@about_u)
    click_on "Destroy this about u", match: :first

    assert_text "About u was successfully destroyed"
  end
end
