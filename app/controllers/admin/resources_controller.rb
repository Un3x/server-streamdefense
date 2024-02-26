# frozen_string_literal: true

module Admin
  class ResourcesController < AdminUsersController
    before_action :set_resource, only: %i[show edit update destroy]

    # GET /admin/resources or /admin/resources.json
    def index
      @resources = Resource.all
    end

    # GET /admin/resources/1 or /admin/resources/1.json
    def show; end

    # GET /admin/resources/new
    def new
      @resource = Resource.new
    end

    # GET /admin/resources/1/edit
    def edit; end

    # POST /admin/resources or /admin/resources.json
    def create
      @resource = Resource.new(resource_params)

      respond_to do |format|
        if @resource.save
          format.html { redirect_to admin_resource_url(@resource), notice: 'Resource was successfully created.' }
          format.json { render :show, status: :created, location: @resource }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/resources/1 or /admin/resources/1.json
    def update
      respond_to do |format|
        if @resource.update(resource_params)
          format.html { redirect_to admin_resource_url(@resource), notice: 'Resource was successfully updated.' }
          format.json { render :show, status: :ok, location: @resource }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/resources/1 or /admin/resources/1.json
    def destroy
      @resource.destroy!

      respond_to do |format|
        format.html { redirect_to admin_resources_url, notice: 'Resource was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:resource).permit(:name, :key)
    end
  end
end
