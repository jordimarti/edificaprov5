require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  setup do
    @video = videos(:one)
  end

  test "visiting the index" do
    visit videos_url
    assert_selector "h1", text: "Videos"
  end

  test "should create video" do
    visit videos_url
    click_on "New video"

    fill_in "Aspect ratio", with: @video.aspect_ratio
    fill_in "Channel", with: @video.channel_id
    fill_in "Duration", with: @video.duration
    fill_in "Max stored frame rate", with: @video.max_stored_frame_rate
    fill_in "Max stored resolution", with: @video.max_stored_resolution
    fill_in "Mux asset", with: @video.mux_asset_id
    fill_in "Playback", with: @video.playback_id
    fill_in "Policy", with: @video.policy
    fill_in "Publicid", with: @video.publicid
    fill_in "Score", with: @video.score
    fill_in "Status", with: @video.status
    fill_in "Title", with: @video.title
    check "Visible" if @video.visible
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "should update Video" do
    visit video_url(@video)
    click_on "Edit this video", match: :first

    fill_in "Aspect ratio", with: @video.aspect_ratio
    fill_in "Channel", with: @video.channel_id
    fill_in "Duration", with: @video.duration
    fill_in "Max stored frame rate", with: @video.max_stored_frame_rate
    fill_in "Max stored resolution", with: @video.max_stored_resolution
    fill_in "Mux asset", with: @video.mux_asset_id
    fill_in "Playback", with: @video.playback_id
    fill_in "Policy", with: @video.policy
    fill_in "Publicid", with: @video.publicid
    fill_in "Score", with: @video.score
    fill_in "Status", with: @video.status
    fill_in "Title", with: @video.title
    check "Visible" if @video.visible
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "should destroy Video" do
    visit video_url(@video)
    click_on "Destroy this video", match: :first

    assert_text "Video was successfully destroyed"
  end
end
