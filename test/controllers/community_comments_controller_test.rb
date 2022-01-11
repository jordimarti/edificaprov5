require "test_helper"

class CommunityCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_comment = community_comments(:one)
  end

  test "should get index" do
    get community_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_community_comment_url
    assert_response :success
  end

  test "should create community_comment" do
    assert_difference("CommunityComment.count") do
      post community_comments_url, params: { community_comment: { community_id: @community_comment.community_id, user_id: @community_comment.user_id } }
    end

    assert_redirected_to community_comment_url(CommunityComment.last)
  end

  test "should show community_comment" do
    get community_comment_url(@community_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_comment_url(@community_comment)
    assert_response :success
  end

  test "should update community_comment" do
    patch community_comment_url(@community_comment), params: { community_comment: { community_id: @community_comment.community_id, user_id: @community_comment.user_id } }
    assert_redirected_to community_comment_url(@community_comment)
  end

  test "should destroy community_comment" do
    assert_difference("CommunityComment.count", -1) do
      delete community_comment_url(@community_comment)
    end

    assert_redirected_to community_comments_url
  end
end
