require "test_helper"

class IdlePlayerResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idle_player_resource = idle_player_resources(:one)
  end

  test "should get index" do
    get idle_player_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_idle_player_resource_url
    assert_response :success
  end

  test "should create idle_player_resource" do
    assert_difference("IdlePlayerResource.count") do
      post idle_player_resources_url, params: { idle_player_resource: { idle_players_id: @idle_player_resource.idle_players_id, quantity: @idle_player_resource.quantity, resources_id: @idle_player_resource.resources_id } }
    end

    assert_redirected_to idle_player_resource_url(IdlePlayerResource.last)
  end

  test "should show idle_player_resource" do
    get idle_player_resource_url(@idle_player_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_idle_player_resource_url(@idle_player_resource)
    assert_response :success
  end

  test "should update idle_player_resource" do
    patch idle_player_resource_url(@idle_player_resource), params: { idle_player_resource: { idle_players_id: @idle_player_resource.idle_players_id, quantity: @idle_player_resource.quantity, resources_id: @idle_player_resource.resources_id } }
    assert_redirected_to idle_player_resource_url(@idle_player_resource)
  end

  test "should destroy idle_player_resource" do
    assert_difference("IdlePlayerResource.count", -1) do
      delete idle_player_resource_url(@idle_player_resource)
    end

    assert_redirected_to idle_player_resources_url
  end
end
