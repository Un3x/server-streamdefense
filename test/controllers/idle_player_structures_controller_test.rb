require "test_helper"

class IdlePlayerStructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idle_player_structure = idle_player_structures(:one)
  end

  test "should get index" do
    get idle_player_structures_url
    assert_response :success
  end

  test "should get new" do
    get new_idle_player_structure_url
    assert_response :success
  end

  test "should create idle_player_structure" do
    assert_difference("IdlePlayerStructure.count") do
      post idle_player_structures_url, params: { idle_player_structure: { idle_players_id: @idle_player_structure.idle_players_id, level: @idle_player_structure.level, structures_id: @idle_player_structure.structures_id } }
    end

    assert_redirected_to idle_player_structure_url(IdlePlayerStructure.last)
  end

  test "should show idle_player_structure" do
    get idle_player_structure_url(@idle_player_structure)
    assert_response :success
  end

  test "should get edit" do
    get edit_idle_player_structure_url(@idle_player_structure)
    assert_response :success
  end

  test "should update idle_player_structure" do
    patch idle_player_structure_url(@idle_player_structure), params: { idle_player_structure: { idle_players_id: @idle_player_structure.idle_players_id, level: @idle_player_structure.level, structures_id: @idle_player_structure.structures_id } }
    assert_redirected_to idle_player_structure_url(@idle_player_structure)
  end

  test "should destroy idle_player_structure" do
    assert_difference("IdlePlayerStructure.count", -1) do
      delete idle_player_structure_url(@idle_player_structure)
    end

    assert_redirected_to idle_player_structures_url
  end
end
