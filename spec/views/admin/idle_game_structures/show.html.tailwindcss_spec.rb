# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_structures/show', type: :view do
  before(:each) do
    assign(:idle_game_structure, IdleGameStructure.create!(
      structure: Structure.create!(
        name: 'MyString',
        description: 'MyString'
      ),
      idle_game: IdleGame.create!(
        channel: Channel.create!(twitch_id: 'MyString'),
        user: create(:user)
      ),
      level: 1
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
