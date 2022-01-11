require "test_helper"

class QuestionCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_comment = question_comments(:one)
  end

  test "should get index" do
    get question_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_question_comment_url
    assert_response :success
  end

  test "should create question_comment" do
    assert_difference("QuestionComment.count") do
      post question_comments_url, params: { question_comment: { question_id: @question_comment.question_id, user_id: @question_comment.user_id } }
    end

    assert_redirected_to question_comment_url(QuestionComment.last)
  end

  test "should show question_comment" do
    get question_comment_url(@question_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_comment_url(@question_comment)
    assert_response :success
  end

  test "should update question_comment" do
    patch question_comment_url(@question_comment), params: { question_comment: { question_id: @question_comment.question_id, user_id: @question_comment.user_id } }
    assert_redirected_to question_comment_url(@question_comment)
  end

  test "should destroy question_comment" do
    assert_difference("QuestionComment.count", -1) do
      delete question_comment_url(@question_comment)
    end

    assert_redirected_to question_comments_url
  end
end
