# frozen_string_literal: true

module Admin
  class IdleGameStructuresController < AdminUsersController
    before_action :set_idle_game_structure, only: %i[show edit update destroy]

    # GET /admin/idle_game_structures or /admin/idle_game_structures.json
    def index
      @idle_game_structures = IdleGameStructure.all
    end

    # GET /admin/idle_game_structures/1 or /admin/idle_game_structures/1.json
    def show; end

    # GET /admin/idle_game_structures/new
    def new
      @idle_game_structure = IdleGameStructure.new
    end

    # GET /admin/idle_game_structures/1/edit
    def edit; end

    # POST /admin/idle_game_structures or /admin/idle_game_structures.json
    def create
      @idle_game_structure = IdleGameStructure.new(idle_game_structure_params)

      respond_to do |format|
        if @idle_game_structure.save
          format.html { redirect_to admin_idle_game_structure_url(@idle_game_structure), notice: 'Idle player structure was successfully created.' }
          format.json { render :show, status: :created, location: @idle_game_structure }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @idle_game_structure.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/idle_game_structures/1 or /admin/idle_game_structures/1.json
    def update
      respond_to do |format|
        if @idle_game_structure.update(idle_game_structure_params)
          format.html { redirect_to admin_idle_game_structure_url(@idle_game_structure), notice: 'Idle player structure was successfully updated.' }
          format.json { render :show, status: :ok, location: @idle_game_structure }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @idle_game_structure.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/idle_game_structures/1 or /admin/idle_game_structures/1.json
    def destroy
      @idle_game_structure.destroy!

      respond_to do |format|
        format.html { redirect_to admin_idle_game_structures_url, notice: 'Idle player structure was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_idle_game_structure
      @idle_game_structure = IdleGameStructure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_game_structure_params
      params.require(:idle_game_structure).permit(:structure_id, :idle_game_id, :level)
    end
  end
end
