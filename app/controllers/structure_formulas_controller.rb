class StructureFormulasController < ApplicationController
  before_action :set_structure_formula, only: %i[ show edit update destroy ]

  # GET /structure_formulas or /structure_formulas.json
  def index
    @structure_formulas = StructureFormula.all
  end

  # GET /structure_formulas/1 or /structure_formulas/1.json
  def show
  end

  # GET /structure_formulas/new
  def new
    @structure_formula = StructureFormula.new
  end

  # GET /structure_formulas/1/edit
  def edit
  end

  # POST /structure_formulas or /structure_formulas.json
  def create
    @structure_formula = StructureFormula.new(structure_formula_params)

    respond_to do |format|
      if @structure_formula.save
        format.html { redirect_to structure_formula_url(@structure_formula), notice: "Structure formula was successfully created." }
        format.json { render :show, status: :created, location: @structure_formula }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @structure_formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_formulas/1 or /structure_formulas/1.json
  def update
    respond_to do |format|
      if @structure_formula.update(structure_formula_params)
        format.html { redirect_to structure_formula_url(@structure_formula), notice: "Structure formula was successfully updated." }
        format.json { render :show, status: :ok, location: @structure_formula }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @structure_formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_formulas/1 or /structure_formulas/1.json
  def destroy
    @structure_formula.destroy!

    respond_to do |format|
      format.html { redirect_to structure_formulas_url, notice: "Structure formula was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_formula
      @structure_formula = StructureFormula.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_formula_params
      params.require(:structure_formula).permit(:structures_id, :type, :formula)
    end
end
