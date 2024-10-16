# frozen_string_literal: true

class IdleGameController < ApplicationController
  before_action :validate_params
  before_action :identify_channel
  before_action :identify_user
  before_action :idle_game

  def state
    last_sync = @idle_game.last_sync

    IdleSynchronizor.new(@idle_game).perform

    render json: {
      status: 200,
      data: IdleGameFormatter.new(@idle_game, last_sync).perform
    }
  end

  private

  def validate_params
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:channel_id].nil? || params[:viewer_id].nil? || params[:viewer_display_name].nil?
  end

  def identify_channel
    @channel = Channel.find_or_create_by!(twitch_id: 666)
  end

  def identify_user
    @user = User.find_by(twitch_id: params[:viewer_id])
    @user = User.create!(twitch_id: params[:viewer_id], nickname: params[:viewer_display_name], role: 'USER') if @user.nil?
  end

  def idle_game
    @idle_game = IdleGame.find_by(user: @user, channel: @channel, season: Season.find_by(active: true))
    @idle_game ||= IdleGameFactory.new(@user, @channel).perform
  end
end
