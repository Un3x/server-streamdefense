# frozen_string_literal: true

class IdleGameController < ApplicationController
  before_action :validate_params
  before_action :identity_channel
  before_action :identify_user
  before_action :fetch_idle_game

  def state
    last_sync = @idle_game.last_sync

    IdleSynchronizor.new(@idle_game).perform

    render json: {
      status: 200,
      data: IdleGameFormatter.new(@idle_game, last_sync).format_idle_game
    }
  end

  private

  def validate_params
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:channel_id].nil? || params[:viewer_id].nil? || params[:viewer_display_name].nil?
  end

  def identity_channel
    @channel = Channel.find_or_create_by!(twitch_id: params[:channel_id])
  end

  def identify_user
    @user = User.find_by(twitch_id: params[:viewer_id])
    @user = User.create!(twitch_id: params[:viewer_id], nickname: params[:viewer_display_name], role: 'USER') if @user.nil?
  end

  def fetch_idle_game
    @idle_game = IdleGame.find_by(user: @user, channel: @channel)
    @idle_game = IdleGameFactory.new(@user, @channel).perform if @idle_game.nil?
  end
end
