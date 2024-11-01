require "test_helper"

class FrequentquestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frequentquestion = frequentquestions(:one)
  end

  test "should get index" do
    get frequentquestions_url
    assert_response :success
  end

  test "should get new" do
    get new_frequentquestion_url
    assert_response :success
  end

  test "should create frequentquestion" do
    assert_difference("Frequentquestion.count") do
      post frequentquestions_url, params: { frequentquestion: { answer: @frequentquestion.answer, question: @frequentquestion.question } }
    end

    assert_redirected_to frequentquestion_url(Frequentquestion.last)
  end

  test "should show frequentquestion" do
    get frequentquestion_url(@frequentquestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_frequentquestion_url(@frequentquestion)
    assert_response :success
  end

  test "should update frequentquestion" do
    patch frequentquestion_url(@frequentquestion), params: { frequentquestion: { answer: @frequentquestion.answer, question: @frequentquestion.question } }
    assert_redirected_to frequentquestion_url(@frequentquestion)
  end

  test "should destroy frequentquestion" do
    assert_difference("Frequentquestion.count", -1) do
      delete frequentquestion_url(@frequentquestion)
    end

    assert_redirected_to frequentquestions_url
  end
end
