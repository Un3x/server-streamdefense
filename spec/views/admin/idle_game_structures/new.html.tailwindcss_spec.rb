# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_structures/new', type: :view do
  before(:each) do
    assign(:idle_game_structure, IdleGameStructure.new(
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

  it 'renders new admin_idle_game_structure form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_game_structures_path, 'post' do
      assert_select 'input[name=?]', 'idle_game_structure[structure_id]'

      assert_select 'input[name=?]', 'idle_game_structure[idle_game_id]'

      assert_select 'input[name=?]', 'idle_game_structure[level]'
    end
  end
end
