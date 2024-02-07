# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_games/edit', type: :view do
  let(:idle_game) do
    IdleGame.create!(
      channel: Channel.create!(twitch_id: 'MyString'),
      user: create(:user)
    )
  end

  before(:each) do
    assign(:idle_game, idle_game)
  end

  it 'renders the edit admin_idle_game form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_game_path(idle_game), 'post' do
      assert_select 'select[name=?]', 'idle_game[channel_id]'

      assert_select 'select[name=?]', 'idle_game[user_id]'
    end
  end
end
