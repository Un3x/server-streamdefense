# frozen_string_literal: true

module Admin
  class StructureFormulasController < AdminUsersController
    before_action :set_structure_formula, only: %i[show edit update destroy]
    before_action :check_import_file, only: :import

    # GET /admin/structure_formulas or /admin/structure_formulas.json
    def index
      @structure_formulas = StructureFormula.all
    end

    # GET /admin/structure_formulas/1 or /admin/structure_formulas/1.json
    def show; end

    def import
      ImportService.new.import_resource_formulas(params[:file])

      redirect_to request.referer, notice: 'Resources imported successfully'
    end

    # GET /admin/structure_formulas/new
    def new
      @structure_formula = StructureFormula.new
    end

    # GET /admin/structure_formulas/1/edit
    def edit; end

    # POST /admin/structure_formulas or /admin/structure_formulas.json
    def create
      @structure_formula = StructureFormula.new(structure_formula_params)

      respond_to do |format|
        if @structure_formula.save!
          format.html { redirect_to admin_structure_formula_url(@structure_formula), notice: 'Structure formula was successfully created.' }
          format.json { render :show, status: :created, location: @structure_formula }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @structure_formula.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/structure_formulas/1 or /admin/structure_formulas/1.json
    def update
      respond_to do |format|
        if @structure_formula.update(structure_formula_params)
          format.html { redirect_to admin_structure_formula_url(@structure_formula), notice: 'Structure formula was successfully updated.' }
          format.json { render :show, status: :ok, location: @structure_formula }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @structure_formula.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/structure_formulas/1 or /admin/structure_formulas/1.json
    def destroy
      @structure_formula.destroy!

      respond_to do |format|
        format.html { redirect_to admin_structure_formulas_url, notice: 'Structure formula was successfully destroyed.' }
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
      cast_params

      params
        .require(:structure_formula)
        .permit(
          :category,
          :resource_id,
          :structure_id,
          :formula,
          *params[:structure_formula][:formula].constantize.stored_attributes[:arguments]
        )
    end

    def cast_params
      params[:structure_formula][:formula].constantize.stored_attributes[:arguments].each do |argument|
        params[:structure_formula][argument] = params[:structure_formula][argument].to_i
      end
    end

    def check_import_file
      return redirect_to request.referer, notice: 'No file selected' if params[:file].nil?

      redirect_to request.referer, notice: 'Invalid file type' unless params[:file].content_type == 'text/csv'
    end
  end
end
