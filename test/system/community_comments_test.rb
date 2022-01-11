require "application_system_test_case"

class CommunityCommentsTest < ApplicationSystemTestCase
  setup do
    @community_comment = community_comments(:one)
  end

  test "visiting the index" do
    visit community_comments_url
    assert_selector "h1", text: "Community comments"
  end

  test "should create community comment" do
    visit community_comments_url
    click_on "New community comment"

    fill_in "Community", with: @community_comment.community_id
    fill_in "User", with: @community_comment.user_id
    click_on "Create Community comment"

    assert_text "Community comment was successfully created"
    click_on "Back"
  end

  test "should update Community comment" do
    visit community_comment_url(@community_comment)
    click_on "Edit this community comment", match: :first

    fill_in "Community", with: @community_comment.community_id
    fill_in "User", with: @community_comment.user_id
    click_on "Update Community comment"

    assert_text "Community comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Community comment" do
    visit community_comment_url(@community_comment)
    click_on "Destroy this community comment", match: :first

    assert_text "Community comment was successfully destroyed"
  end
end
