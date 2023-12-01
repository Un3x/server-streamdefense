class IdlePlayerResourcesController < ApplicationController
  before_action :set_idle_player_resource, only: %i[ show edit update destroy ]

  # GET /idle_player_resources or /idle_player_resources.json
  def index
    @idle_player_resources = IdlePlayerResource.all
  end

  # GET /idle_player_resources/1 or /idle_player_resources/1.json
  def show
  end

  # GET /idle_player_resources/new
  def new
    @idle_player_resource = IdlePlayerResource.new
  end

  # GET /idle_player_resources/1/edit
  def edit
  end

  # POST /idle_player_resources or /idle_player_resources.json
  def create
    @idle_player_resource = IdlePlayerResource.new(idle_player_resource_params)

    respond_to do |format|
      if @idle_player_resource.save
        format.html { redirect_to idle_player_resource_url(@idle_player_resource), notice: "Idle player resource was successfully created." }
        format.json { render :show, status: :created, location: @idle_player_resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idle_player_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idle_player_resources/1 or /idle_player_resources/1.json
  def update
    respond_to do |format|
      if @idle_player_resource.update(idle_player_resource_params)
        format.html { redirect_to idle_player_resource_url(@idle_player_resource), notice: "Idle player resource was successfully updated." }
        format.json { render :show, status: :ok, location: @idle_player_resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idle_player_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idle_player_resources/1 or /idle_player_resources/1.json
  def destroy
    @idle_player_resource.destroy!

    respond_to do |format|
      format.html { redirect_to idle_player_resources_url, notice: "Idle player resource was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idle_player_resource
      @idle_player_resource = IdlePlayerResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_player_resource_params
      params.require(:idle_player_resource).permit(:idle_players_id, :resources_id, :quantity)
    end
end
