# frozen_string_literal: true

module Admin
  class StructuresController < AdminUsersController
    before_action :set_structure, only: %i[show edit update destroy]

    # GET /admin/structures or /admin/structures.json
    def index
      @structures = Structure.all
    end

    # GET /admin/structures/1 or /admin/structures/1.json
    def show; end

    # GET /admin/structures/new
    def new
      @structure = Structure.new
    end

    # GET /admin/structures/1/edit
    def edit; end

    # POST /admin/structures or /admin/structures.json
    def create
      @structure = Structure.new(structure_params)

      respond_to do |format|
        if @structure.save
          format.html { redirect_to admin_structure_url(@structure), notice: 'Structure was successfully created.' }
          format.json { render :show, status: :created, location: @structure }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @structure.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/structures/1 or /admin/structures/1.json
    def update
      respond_to do |format|
        if @structure.update(structure_params)
          format.html { redirect_to admin_structure_url(@structure), notice: 'Structure was successfully updated.' }
          format.json { render :show, status: :ok, location: @structure }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @structure.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/structures/1 or /admin/structures/1.json
    def destroy
      @structure.destroy!

      respond_to do |format|
        format.html { redirect_to admin_structures_url, notice: 'Structure was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_params
      params.require(:structure).permit(:key, :name, :description)
    end
  end
end
