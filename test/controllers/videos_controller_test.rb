require "test_helper"

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get videos_url
    assert_response :success
  end

  test "should get new" do
    get new_video_url
    assert_response :success
  end

  test "should create video" do
    assert_difference("Video.count") do
      post videos_url, params: { video: { aspect_ratio: @video.aspect_ratio, channel_id: @video.channel_id, duration: @video.duration, max_stored_frame_rate: @video.max_stored_frame_rate, max_stored_resolution: @video.max_stored_resolution, mux_asset_id: @video.mux_asset_id, playback_id: @video.playback_id, policy: @video.policy, publicid: @video.publicid, score: @video.score, status: @video.status, title: @video.title, visible: @video.visible } }
    end

    assert_redirected_to video_url(Video.last)
  end

  test "should show video" do
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_url(@video)
    assert_response :success
  end

  test "should update video" do
    patch video_url(@video), params: { video: { aspect_ratio: @video.aspect_ratio, channel_id: @video.channel_id, duration: @video.duration, max_stored_frame_rate: @video.max_stored_frame_rate, max_stored_resolution: @video.max_stored_resolution, mux_asset_id: @video.mux_asset_id, playback_id: @video.playback_id, policy: @video.policy, publicid: @video.publicid, score: @video.score, status: @video.status, title: @video.title, visible: @video.visible } }
    assert_redirected_to video_url(@video)
  end

  test "should destroy video" do
    assert_difference("Video.count", -1) do
      delete video_url(@video)
    end

    assert_redirected_to videos_url
  end
end
