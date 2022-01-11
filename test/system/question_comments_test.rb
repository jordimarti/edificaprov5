require "application_system_test_case"

class QuestionCommentsTest < ApplicationSystemTestCase
  setup do
    @question_comment = question_comments(:one)
  end

  test "visiting the index" do
    visit question_comments_url
    assert_selector "h1", text: "Question comments"
  end

  test "should create question comment" do
    visit question_comments_url
    click_on "New question comment"

    fill_in "Question", with: @question_comment.question_id
    fill_in "User", with: @question_comment.user_id
    click_on "Create Question comment"

    assert_text "Question comment was successfully created"
    click_on "Back"
  end

  test "should update Question comment" do
    visit question_comment_url(@question_comment)
    click_on "Edit this question comment", match: :first

    fill_in "Question", with: @question_comment.question_id
    fill_in "User", with: @question_comment.user_id
    click_on "Update Question comment"

    assert_text "Question comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Question comment" do
    visit question_comment_url(@question_comment)
    click_on "Destroy this question comment", match: :first

    assert_text "Question comment was successfully destroyed"
  end
end
