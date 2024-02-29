# frozen_string_literal: true

module Admin
  class StructureRequirementsController < AdminUsersController
    before_action :set_structure_requirement, only: %i[show edit update destroy]
    before_action :check_import_file, only: :import

    # GET /admin/structure_requirements or /admin/structure_requirements.json
    def index
      @structure_requirements = StructureRequirement.all
    end

    # GET /admin/structure_requirements/1 or /admin/structure_requirements/1.json
    def show; end

    def import
      ImportService.new.import_resource_requirements(params[:file])

      redirect_to request.referer, notice: 'Resources imported successfully'
    end

    # GET /admin/structure_requirements/new
    def new
      @structure_requirement = StructureRequirement.new
    end

    # GET /admin/structure_requirements/1/edit
    def edit; end

    # POST /admin/structure_requirements or /admin/structure_requirements.json
    def create
      @structure_requirement = StructureRequirement.new(structure_requirement_params)

      respond_to do |format|
        if @structure_requirement.save
          format.html { redirect_to admin_structure_requirement_url(@structure_requirement), notice: 'Structure requirement was successfully created.' }
          format.json { render :show, status: :created, location: @structure_requirement }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @structure_requirement.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/structure_requirements/1 or /admin/structure_requirements/1.json
    def update
      respond_to do |format|
        if @structure_requirement.update(structure_requirement_params)
          format.html { redirect_to admin_structure_requirement_url(@structure_requirement), notice: 'Structure requirement was successfully updated.' }
          format.json { render :show, status: :ok, location: @structure_requirement }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @structure_requirement.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/structure_requirements/1 or /admin/structure_requirements/1.json
    def destroy
      @structure_requirement.destroy!

      respond_to do |format|
        format.html { redirect_to admin_structure_requirements_url, notice: 'Structure requirement was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_structure_requirement
      @structure_requirement = StructureRequirement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_requirement_params
      params.require(:structure_requirement).permit(:structure_id, :required_structure_id, :required_level)
    end

    def check_import_file
      return redirect_to request.referer, notice: 'No file selected' if params[:file].nil?

      redirect_to request.referer, notice: 'Invalid file type' unless params[:file].content_type == 'text/csv'
    end
  end
end
