require "application_system_test_case"

class IdlePlayerStructuresTest < ApplicationSystemTestCase
  setup do
    @idle_player_structure = idle_player_structures(:one)
  end

  test "visiting the index" do
    visit idle_player_structures_url
    assert_selector "h1", text: "Idle player structures"
  end

  test "should create idle player structure" do
    visit idle_player_structures_url
    click_on "New idle player structure"

    fill_in "Idle players", with: @idle_player_structure.idle_players_id
    fill_in "Level", with: @idle_player_structure.level
    fill_in "Structures", with: @idle_player_structure.structures_id
    click_on "Create Idle player structure"

    assert_text "Idle player structure was successfully created"
    click_on "Back"
  end

  test "should update Idle player structure" do
    visit idle_player_structure_url(@idle_player_structure)
    click_on "Edit this idle player structure", match: :first

    fill_in "Idle players", with: @idle_player_structure.idle_players_id
    fill_in "Level", with: @idle_player_structure.level
    fill_in "Structures", with: @idle_player_structure.structures_id
    click_on "Update Idle player structure"

    assert_text "Idle player structure was successfully updated"
    click_on "Back"
  end

  test "should destroy Idle player structure" do
    visit idle_player_structure_url(@idle_player_structure)
    click_on "Destroy this idle player structure", match: :first

    assert_text "Idle player structure was successfully destroyed"
  end
end
