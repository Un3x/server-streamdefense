class IdlePlayerStructuresController < ApplicationController
  before_action :set_idle_player_structure, only: %i[ show edit update destroy ]

  # GET /idle_player_structures or /idle_player_structures.json
  def index
    @idle_player_structures = IdlePlayerStructure.all
  end

  # GET /idle_player_structures/1 or /idle_player_structures/1.json
  def show
  end

  # GET /idle_player_structures/new
  def new
    @idle_player_structure = IdlePlayerStructure.new
  end

  # GET /idle_player_structures/1/edit
  def edit
  end

  # POST /idle_player_structures or /idle_player_structures.json
  def create
    @idle_player_structure = IdlePlayerStructure.new(idle_player_structure_params)

    respond_to do |format|
      if @idle_player_structure.save
        format.html { redirect_to idle_player_structure_url(@idle_player_structure), notice: "Idle player structure was successfully created." }
        format.json { render :show, status: :created, location: @idle_player_structure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idle_player_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idle_player_structures/1 or /idle_player_structures/1.json
  def update
    respond_to do |format|
      if @idle_player_structure.update(idle_player_structure_params)
        format.html { redirect_to idle_player_structure_url(@idle_player_structure), notice: "Idle player structure was successfully updated." }
        format.json { render :show, status: :ok, location: @idle_player_structure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idle_player_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idle_player_structures/1 or /idle_player_structures/1.json
  def destroy
    @idle_player_structure.destroy!

    respond_to do |format|
      format.html { redirect_to idle_player_structures_url, notice: "Idle player structure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idle_player_structure
      @idle_player_structure = IdlePlayerStructure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_player_structure_params
      params.require(:idle_player_structure).permit(:structures_id, :idle_players_id, :level)
    end
end
