require "application_system_test_case"

class FrequentquestionsTest < ApplicationSystemTestCase
  setup do
    @frequentquestion = frequentquestions(:one)
  end

  test "visiting the index" do
    visit frequentquestions_url
    assert_selector "h1", text: "Frequentquestions"
  end

  test "should create frequentquestion" do
    visit frequentquestions_url
    click_on "New frequentquestion"

    fill_in "Answer", with: @frequentquestion.answer
    fill_in "Question", with: @frequentquestion.question
    click_on "Create Frequentquestion"

    assert_text "Frequentquestion was successfully created"
    click_on "Back"
  end

  test "should update Frequentquestion" do
    visit frequentquestion_url(@frequentquestion)
    click_on "Edit this frequentquestion", match: :first

    fill_in "Answer", with: @frequentquestion.answer
    fill_in "Question", with: @frequentquestion.question
    click_on "Update Frequentquestion"

    assert_text "Frequentquestion was successfully updated"
    click_on "Back"
  end

  test "should destroy Frequentquestion" do
    visit frequentquestion_url(@frequentquestion)
    click_on "Destroy this frequentquestion", match: :first

    assert_text "Frequentquestion was successfully destroyed"
  end
end
