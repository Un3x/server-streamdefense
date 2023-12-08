# frozen_string_literal: true

module Admin
  class IdleGameResourcesController < AdminUsersController
    before_action :set_idle_game_resource, only: %i[show edit update destroy]

    # GET /admin/idle_game_resources or /admin/idle_game_resources.json
    def index
      @idle_game_resources = IdleGameResource.all
    end

    # GET /admin/idle_game_resources/1 or /admin/idle_game_resources/1.json
    def show; end

    # GET /admin/idle_game_resources/new
    def new
      @idle_game_resource = IdleGameResource.new
    end

    # GET /admin/idle_game_resources/1/edit
    def edit; end

    # POST /admin/idle_game_resources or /admin/idle_game_resources.json
    def create
      @idle_game_resource = IdleGameResource.new(idle_game_resource_params)

      respond_to do |format|
        if @idle_game_resource.save
          format.html { redirect_to admin_idle_game_resource_url(@idle_game_resource), notice: 'Idle game resource was successfully created.' }
          format.json { render :show, status: :created, location: @idle_game_resource }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @idle_game_resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/idle_game_resources/1 or /admin/idle_game_resources/1.json
    def update
      respond_to do |format|
        if @idle_game_resource.update(idle_game_resource_params)
          format.html { redirect_to admin_idle_game_resource_url(@idle_game_resource), notice: 'Idle game resource was successfully updated.' }
          format.json { render :show, status: :ok, location: @idle_game_resource }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @idle_game_resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/idle_game_resources/1 or /admin/idle_game_resources/1.json
    def destroy
      @idle_game_resource.destroy!

      respond_to do |format|
        format.html { redirect_to admin_idle_game_resources_url, notice: 'Idle game resource was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_idle_game_resource
      @idle_game_resource = IdleGameResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_game_resource_params
      params.require(:idle_game_resource).permit(:idle_game_id, :resource_id, :quantity)
    end
  end
end
