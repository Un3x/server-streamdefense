# frozen_string_literal: true

module Admin
  class ChannelsController < AdminUsersController
    before_action :set_channel, only: %i[show edit update destroy]

    # GET /admin/channels or /admin/channels.json
    def index
      @channels = Channel.all
    end

    # GET /admin/channels/1 or /admin/channels/1.json
    def show; end

    # GET /admin/channels/new
    def new
      @channel = Channel.new
    end

    # GET /admin/channels/1/edit
    def edit; end

    # POST /admin/channels or /admin/channels.json
    def create
      @channel = Channel.new(channel_params)

      respond_to do |format|
        if @channel.save
          format.html { redirect_to admin_channel_url(@channel), notice: 'Channel was successfully created.' }
          format.json { render :show, status: :created, location: @channel }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @channel.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/channels/1 or /admin/channels/1.json
    def update
      respond_to do |format|
        if @channel.update(channel_params)
          format.html { redirect_to admin_channel_url(@channel), notice: 'Channel was successfully updated.' }
          format.json { render :show, status: :ok, location: @channel }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @channel.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/channels/1 or /admin/channels/1.json
    def destroy
      @channel.destroy!

      respond_to do |format|
        format.html { redirect_to admin_channels_url, notice: 'Channel was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:twitch_id)
    end
  end
end
