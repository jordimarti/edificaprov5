require "test_helper"

class LessonCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_comment = lesson_comments(:one)
  end

  test "should get index" do
    get lesson_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_comment_url
    assert_response :success
  end

  test "should create lesson_comment" do
    assert_difference("LessonComment.count") do
      post lesson_comments_url, params: { lesson_comment: { lesson_id: @lesson_comment.lesson_id, user_id: @lesson_comment.user_id } }
    end

    assert_redirected_to lesson_comment_url(LessonComment.last)
  end

  test "should show lesson_comment" do
    get lesson_comment_url(@lesson_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_comment_url(@lesson_comment)
    assert_response :success
  end

  test "should update lesson_comment" do
    patch lesson_comment_url(@lesson_comment), params: { lesson_comment: { lesson_id: @lesson_comment.lesson_id, user_id: @lesson_comment.user_id } }
    assert_redirected_to lesson_comment_url(@lesson_comment)
  end

  test "should destroy lesson_comment" do
    assert_difference("LessonComment.count", -1) do
      delete lesson_comment_url(@lesson_comment)
    end

    assert_redirected_to lesson_comments_url
  end
end
