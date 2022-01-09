require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get videos" do
    get dashboard_videos_url
    assert_response :success
  end

  test "should get articles" do
    get dashboard_articles_url
    assert_response :success
  end

  test "should get courses" do
    get dashboard_courses_url
    assert_response :success
  end

  test "should get communities" do
    get dashboard_communities_url
    assert_response :success
  end

  test "should get billing" do
    get dashboard_billing_url
    assert_response :success
  end
end
