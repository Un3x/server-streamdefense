# frozen_string_literal: true

# frozen_literal_string: true

class IdleGameTradeRequestController < ApplicationController
  before_action :validate_params
  before_action :validate_new_trade_request_params, only: [:new]
  before_action :identity_channel
  before_action :identify_user
  before_action :idle_game
  before_action :trade_request

  def new
    @trade_request = TradeRequest.create(idle_game: @idle_game, resource: Resource.find_by(key: params[:resource_key]), quantity: params[:quantity], active: true) if @trade_request.nil?

    render json: {
      status: 200,
      data: TradeRequestsFormatter.new(@idle_game).perform
    }
  end

  def list
    render json: {
      status: 200,
      data: TradeRequestsFormatter.new(@idle_game).perform
    }
  end

  def fullfill
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:trade_request_id].nil?

    IdleSynchronizor.new(@idle_game).perform

    trade_request_to_fullfill = TradeRequest.find(params[:trade_request_id])

    trade_request_to_fullfill.update!(active: false) if trade_request_to_fullfill.present? && trade_request_to_fullfill.active? && check_resource(trade_request_to_fullfill)

    render json: {
      status: 200,
      data: TradeRequestsFormatter.new(@idle_game).perform
    }
  end

  private

  def validate_params
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:channel_id].nil? || params[:viewer_id].nil? || params[:viewer_display_name].nil?
  end

  def validate_new_trade_request_params
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:resource_key].nil? || params[:quantity].nil?
  end

  def identity_channel
    @channel = Channel.find_by(twitch_id: params[:channel_id])
  end

  def identify_user
    @user = User.find_by(twitch_id: params[:viewer_id])
  end

  def idle_game
    @idle_game = IdleGame.find_by(user: @user, channel: @channel, season: Season.find_by(active: true))

    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if @idle_game.nil?
  end

  def trade_request
    @trade_request = TradeRequest.find_by(idle_game: @idle_game, active: true)
  end

  def check_resource(trade_request)
    idle_game_resource = @idle_game.idle_game_resources.find_by(resource: trade_request.resource)
    return false if idle_game_resource.quantity < trade_request.quantity

    idle_game_resource.update!(quantity: idle_game_resource.quantity - trade_request.quantity)

    true
  end
end
