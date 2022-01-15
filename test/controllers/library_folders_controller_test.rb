require "test_helper"

class LibraryFoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_folder = library_folders(:one)
  end

  test "should get index" do
    get library_folders_url
    assert_response :success
  end

  test "should get new" do
    get new_library_folder_url
    assert_response :success
  end

  test "should create library_folder" do
    assert_difference("LibraryFolder.count") do
      post library_folders_url, params: { library_folder: { channel_id: @library_folder.channel_id, name: @library_folder.name } }
    end

    assert_redirected_to library_folder_url(LibraryFolder.last)
  end

  test "should show library_folder" do
    get library_folder_url(@library_folder)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_folder_url(@library_folder)
    assert_response :success
  end

  test "should update library_folder" do
    patch library_folder_url(@library_folder), params: { library_folder: { channel_id: @library_folder.channel_id, name: @library_folder.name } }
    assert_redirected_to library_folder_url(@library_folder)
  end

  test "should destroy library_folder" do
    assert_difference("LibraryFolder.count", -1) do
      delete library_folder_url(@library_folder)
    end

    assert_redirected_to library_folders_url
  end
end
