require "application_system_test_case"

class IdlePlayerResourcesTest < ApplicationSystemTestCase
  setup do
    @idle_player_resource = idle_player_resources(:one)
  end

  test "visiting the index" do
    visit idle_player_resources_url
    assert_selector "h1", text: "Idle player resources"
  end

  test "should create idle player resource" do
    visit idle_player_resources_url
    click_on "New idle player resource"

    fill_in "Idle players", with: @idle_player_resource.idle_players_id
    fill_in "Quantity", with: @idle_player_resource.quantity
    fill_in "Resources", with: @idle_player_resource.resources_id
    click_on "Create Idle player resource"

    assert_text "Idle player resource was successfully created"
    click_on "Back"
  end

  test "should update Idle player resource" do
    visit idle_player_resource_url(@idle_player_resource)
    click_on "Edit this idle player resource", match: :first

    fill_in "Idle players", with: @idle_player_resource.idle_players_id
    fill_in "Quantity", with: @idle_player_resource.quantity
    fill_in "Resources", with: @idle_player_resource.resources_id
    click_on "Update Idle player resource"

    assert_text "Idle player resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Idle player resource" do
    visit idle_player_resource_url(@idle_player_resource)
    click_on "Destroy this idle player resource", match: :first

    assert_text "Idle player resource was successfully destroyed"
  end
end
