require "test_helper"

class StructureFormulasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @structure_formula = structure_formulas(:one)
  end

  test "should get index" do
    get structure_formulas_url
    assert_response :success
  end

  test "should get new" do
    get new_structure_formula_url
    assert_response :success
  end

  test "should create structure_formula" do
    assert_difference("StructureFormula.count") do
      post structure_formulas_url, params: { structure_formula: { formula: @structure_formula.formula, structures_id: @structure_formula.structures_id, type: @structure_formula.type } }
    end

    assert_redirected_to structure_formula_url(StructureFormula.last)
  end

  test "should show structure_formula" do
    get structure_formula_url(@structure_formula)
    assert_response :success
  end

  test "should get edit" do
    get edit_structure_formula_url(@structure_formula)
    assert_response :success
  end

  test "should update structure_formula" do
    patch structure_formula_url(@structure_formula), params: { structure_formula: { formula: @structure_formula.formula, structures_id: @structure_formula.structures_id, type: @structure_formula.type } }
    assert_redirected_to structure_formula_url(@structure_formula)
  end

  test "should destroy structure_formula" do
    assert_difference("StructureFormula.count", -1) do
      delete structure_formula_url(@structure_formula)
    end

    assert_redirected_to structure_formulas_url
  end
end
