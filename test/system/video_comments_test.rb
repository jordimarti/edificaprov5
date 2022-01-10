require "application_system_test_case"

class VideoCommentsTest < ApplicationSystemTestCase
  setup do
    @video_comment = video_comments(:one)
  end

  test "visiting the index" do
    visit video_comments_url
    assert_selector "h1", text: "Video comments"
  end

  test "should create video comment" do
    visit video_comments_url
    click_on "New video comment"

    fill_in "User", with: @video_comment.user_id
    fill_in "Video", with: @video_comment.video_id
    click_on "Create Video comment"

    assert_text "Video comment was successfully created"
    click_on "Back"
  end

  test "should update Video comment" do
    visit video_comment_url(@video_comment)
    click_on "Edit this video comment", match: :first

    fill_in "User", with: @video_comment.user_id
    fill_in "Video", with: @video_comment.video_id
    click_on "Update Video comment"

    assert_text "Video comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Video comment" do
    visit video_comment_url(@video_comment)
    click_on "Destroy this video comment", match: :first

    assert_text "Video comment was successfully destroyed"
  end
end
