require "application_system_test_case"

class LibraryItemsTest < ApplicationSystemTestCase
  setup do
    @library_item = library_items(:one)
  end

  test "visiting the index" do
    visit library_items_url
    assert_selector "h1", text: "Library items"
  end

  test "should create library item" do
    visit library_items_url
    click_on "New library item"

    fill_in "Category", with: @library_item.category
    fill_in "Itemid", with: @library_item.itemid
    fill_in "Library folder", with: @library_item.library_folder_id
    click_on "Create Library item"

    assert_text "Library item was successfully created"
    click_on "Back"
  end

  test "should update Library item" do
    visit library_item_url(@library_item)
    click_on "Edit this library item", match: :first

    fill_in "Category", with: @library_item.category
    fill_in "Itemid", with: @library_item.itemid
    fill_in "Library folder", with: @library_item.library_folder_id
    click_on "Update Library item"

    assert_text "Library item was successfully updated"
    click_on "Back"
  end

  test "should destroy Library item" do
    visit library_item_url(@library_item)
    click_on "Destroy this library item", match: :first

    assert_text "Library item was successfully destroyed"
  end
end
