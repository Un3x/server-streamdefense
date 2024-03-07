# frozen_string_literal: true

module Admin
  class StructureLevelDetailsController < AdminUsersController
    include ImportManagement

    before_action :set_structure_level_detail, only: %i[show edit update destroy]

    # GET /admin/structure_level_details or /admin/structure_level_details.json
    def index
      @structure_level_details = StructureLevelDetail.all
    end

    # GET /admin/structure_level_details/1 or /admin/structure_level_details/1.json
    def show; end

    def import
      ImportService.new.import(params[:file], 'structure_level_detail')

      redirect_to request.referer, notice: 'Resources imported successfully'
    end

    # GET /admin/structure_level_details/new
    def new
      @structure_level_detail = StructureLevelDetail.new
    end

    # GET /admin/structure_level_details/1/edit
    def edit; end

    # POST /admin/structure_level_details or /admin/structure_level_details.json
    def create
      @structure_level_detail = StructureLevelDetail.new(structure_level_detail_params)

      respond_to do |format|
        if @structure_level_detail.save
          format.html { redirect_to admin_structure_level_detail_url(@structure_level_detail), notice: 'Structure level detail was successfully created.' }
          format.json { render :show, status: :created, location: @structure_level_detail }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @structure_level_detail.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/structure_level_details/1 or /admin/structure_level_details/1.json
    def update
      respond_to do |format|
        if @structure_level_detail.update(structure_level_detail_params)
          format.html { redirect_to admin_structure_level_detail_url(@structure_level_detail), notice: 'Structure level detail was successfully updated.' }
          format.json { render :show, status: :ok, location: @structure_level_detail }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @structure_level_detail.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/structure_level_details/1 or /admin/structure_level_details/1.json
    def destroy
      @structure_level_detail.destroy!

      respond_to do |format|
        format.html { redirect_to admin_structure_level_details_url, notice: 'Structure level detail was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_structure_level_detail
      @structure_level_detail = StructureLevelDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_level_detail_params
      params.require(:structure_level_detail).permit(:structure_id, :level, :description, :image)
    end
  end
end
