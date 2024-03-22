# frozen_string_literal: true

module Admin
  class TradeRequestsController < AdminUsersController
    before_action :set_trade_request, only: %i[show]

    # GET /admin/trade_requests or /admin/trade_requests.json
    def index
      @trade_requests = TradeRequest.all
    end

    # GET /admin/trade_requests/1 or /admin/trade_requests/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_trade_request
      @trade_request = TradeRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_request_params
      params.require(:trade_request).permit(:idle_game_id, :resource_id, :quantity, :active)
    end
  end
end
