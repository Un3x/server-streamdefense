require "application_system_test_case"

class IdlePlayersTest < ApplicationSystemTestCase
  setup do
    @idle_player = idle_players(:one)
  end

  test "visiting the index" do
    visit idle_players_url
    assert_selector "h1", text: "Idle players"
  end

  test "should create idle player" do
    visit idle_players_url
    click_on "New idle player"

    fill_in "Channel", with: @idle_player.channel_id
    fill_in "User", with: @idle_player.user_id
    click_on "Create Idle player"

    assert_text "Idle player was successfully created"
    click_on "Back"
  end

  test "should update Idle player" do
    visit idle_player_url(@idle_player)
    click_on "Edit this idle player", match: :first

    fill_in "Channel", with: @idle_player.channel_id
    fill_in "User", with: @idle_player.user_id
    click_on "Update Idle player"

    assert_text "Idle player was successfully updated"
    click_on "Back"
  end

  test "should destroy Idle player" do
    visit idle_player_url(@idle_player)
    click_on "Destroy this idle player", match: :first

    assert_text "Idle player was successfully destroyed"
  end
end
