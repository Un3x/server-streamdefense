require "application_system_test_case"

class StructureFormulasTest < ApplicationSystemTestCase
  setup do
    @structure_formula = structure_formulas(:one)
  end

  test "visiting the index" do
    visit structure_formulas_url
    assert_selector "h1", text: "Structure formulas"
  end

  test "should create structure formula" do
    visit structure_formulas_url
    click_on "New structure formula"

    fill_in "Formula", with: @structure_formula.formula
    fill_in "Structures", with: @structure_formula.structures_id
    fill_in "Type", with: @structure_formula.type
    click_on "Create Structure formula"

    assert_text "Structure formula was successfully created"
    click_on "Back"
  end

  test "should update Structure formula" do
    visit structure_formula_url(@structure_formula)
    click_on "Edit this structure formula", match: :first

    fill_in "Formula", with: @structure_formula.formula
    fill_in "Structures", with: @structure_formula.structures_id
    fill_in "Type", with: @structure_formula.type
    click_on "Update Structure formula"

    assert_text "Structure formula was successfully updated"
    click_on "Back"
  end

  test "should destroy Structure formula" do
    visit structure_formula_url(@structure_formula)
    click_on "Destroy this structure formula", match: :first

    assert_text "Structure formula was successfully destroyed"
  end
end
