# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_structures/edit', type: :view do
  let(:idle_game_structure) do
    IdleGameStructure.create!(
      structure: Structure.create!(
        name: 'MyString',
        description: 'MyString'
      ),
      idle_game: IdleGame.create!(
        channel: Channel.create!(twitch_id: 'MyString'),
        user: create(:user)
      ),
      level: 1
    )
  end

  before(:each) do
    assign(:idle_game_structure, idle_game_structure)
  end

  it 'renders the edit admin_idle_game_structure form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_game_structure_path(idle_game_structure), 'post' do
      assert_select 'input[name=?]', 'idle_game_structure[structure_id]'

      assert_select 'input[name=?]', 'idle_game_structure[idle_game_id]'

      assert_select 'input[name=?]', 'idle_game_structure[level]'
    end
  end
end
