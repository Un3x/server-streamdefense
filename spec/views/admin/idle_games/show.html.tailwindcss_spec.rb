# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_games/show', type: :view do
  before(:each) do
    assign(:idle_game, IdleGame.create!(
                         channel: Channel.create!(twitch_id: 'MyString'),
                         user: create(:user)
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
