require "application_system_test_case"

class LessonCommentsTest < ApplicationSystemTestCase
  setup do
    @lesson_comment = lesson_comments(:one)
  end

  test "visiting the index" do
    visit lesson_comments_url
    assert_selector "h1", text: "Lesson comments"
  end

  test "should create lesson comment" do
    visit lesson_comments_url
    click_on "New lesson comment"

    fill_in "Lesson", with: @lesson_comment.lesson_id
    fill_in "User", with: @lesson_comment.user_id
    click_on "Create Lesson comment"

    assert_text "Lesson comment was successfully created"
    click_on "Back"
  end

  test "should update Lesson comment" do
    visit lesson_comment_url(@lesson_comment)
    click_on "Edit this lesson comment", match: :first

    fill_in "Lesson", with: @lesson_comment.lesson_id
    fill_in "User", with: @lesson_comment.user_id
    click_on "Update Lesson comment"

    assert_text "Lesson comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Lesson comment" do
    visit lesson_comment_url(@lesson_comment)
    click_on "Destroy this lesson comment", match: :first

    assert_text "Lesson comment was successfully destroyed"
  end
end
