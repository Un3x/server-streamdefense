require "test_helper"

class IdlePlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idle_player = idle_players(:one)
  end

  test "should get index" do
    get idle_players_url
    assert_response :success
  end

  test "should get new" do
    get new_idle_player_url
    assert_response :success
  end

  test "should create idle_player" do
    assert_difference("IdlePlayer.count") do
      post idle_players_url, params: { idle_player: { channel_id: @idle_player.channel_id, user_id: @idle_player.user_id } }
    end

    assert_redirected_to idle_player_url(IdlePlayer.last)
  end

  test "should show idle_player" do
    get idle_player_url(@idle_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_idle_player_url(@idle_player)
    assert_response :success
  end

  test "should update idle_player" do
    patch idle_player_url(@idle_player), params: { idle_player: { channel_id: @idle_player.channel_id, user_id: @idle_player.user_id } }
    assert_redirected_to idle_player_url(@idle_player)
  end

  test "should destroy idle_player" do
    assert_difference("IdlePlayer.count", -1) do
      delete idle_player_url(@idle_player)
    end

    assert_redirected_to idle_players_url
  end
end
