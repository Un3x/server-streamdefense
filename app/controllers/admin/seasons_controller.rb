# frozen_string_literal: true

module Admin
  class SeasonsController < AdminUsersController
    before_action :set_season, only: %i[show edit update destroy]

    # GET /admin/seasons or /admin/seasons.json
    def index
      @seasons = Season.all
    end

    # GET /admin/seasons/1 or /admin/seasons/1.json
    def show; end

    # GET /admin/seasons/new
    def new
      @season = Season.new
    end

    # GET /admin/seasons/1/edit
    def edit; end

    # POST /admin/seasons or /admin/seasons.json
    def create
      @season = Season.new(season_params)

      respond_to do |format|
        if @season.save
          handle_active
          handle_old_season_copy
          format.html { redirect_to admin_season_url(@season), notice: 'Season was successfully created.' }
          format.json { render :show, status: :created, location: @season }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @season.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/seasons/1 or /admin/seasons/1.json
    def update
      respond_to do |format|
        if @season.update(season_params)
          handle_active
          format.html { redirect_to admin_season_url(@season), notice: 'Season was successfully updated.' }
          format.json { render :show, status: :ok, location: @season }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @season.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/seasons/1 or /admin/seasons/1.json
    def destroy
      @season.destroy!

      respond_to do |format|
        format.html { redirect_to admin_seasons_url, notice: 'Season was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def handle_old_season_copy
      return if params[:season][:old_season_id].blank?

      old_season = Season.find(params[:season][:old_season_id])

      CopySeasonConfiguration.new(@season, old_season).perform
    end

    def handle_active
      return unless @season.active

      Season.where.not(id: @season.id).update_all(active: false)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.require(:season).permit(:name, :speed, :active)
    end
  end
end
