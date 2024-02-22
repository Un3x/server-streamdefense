# frozen_string_literal: true

module Admin
  class ChannelsController < AdminUsersController
    before_action :set_channel, only: %i[show]

    # GET /admin/channels or /admin/channels.json
    def index
      @channels = Channel.all
    end

    # GET /admin/channels/1 or /admin/channels/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end
  end
end
