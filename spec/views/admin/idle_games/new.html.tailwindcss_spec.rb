# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_games/new', type: :view do
  before(:each) do
    assign(:idle_game, build(:idle_game))
  end

  it 'renders new admin_idle_game form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_games_path, 'post' do
      assert_select 'select[name=?]', 'idle_game[channel_id]'

      assert_select 'select[name=?]', 'idle_game[user_id]'
    end
  end
end
