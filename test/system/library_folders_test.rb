require "application_system_test_case"

class LibraryFoldersTest < ApplicationSystemTestCase
  setup do
    @library_folder = library_folders(:one)
  end

  test "visiting the index" do
    visit library_folders_url
    assert_selector "h1", text: "Library folders"
  end

  test "should create library folder" do
    visit library_folders_url
    click_on "New library folder"

    fill_in "Channel", with: @library_folder.channel_id
    fill_in "Name", with: @library_folder.name
    click_on "Create Library folder"

    assert_text "Library folder was successfully created"
    click_on "Back"
  end

  test "should update Library folder" do
    visit library_folder_url(@library_folder)
    click_on "Edit this library folder", match: :first

    fill_in "Channel", with: @library_folder.channel_id
    fill_in "Name", with: @library_folder.name
    click_on "Update Library folder"

    assert_text "Library folder was successfully updated"
    click_on "Back"
  end

  test "should destroy Library folder" do
    visit library_folder_url(@library_folder)
    click_on "Destroy this library folder", match: :first

    assert_text "Library folder was successfully destroyed"
  end
end
