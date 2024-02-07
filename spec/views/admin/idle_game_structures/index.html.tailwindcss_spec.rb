# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_structures/index', type: :view do
  before(:each) do
    assign(:idle_game_structures, [create(:idle_game_structure), create(:idle_game_structure)])
  end

  it 'renders a list of admin/idle_game_structures' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Idle Game'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Structure'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Level'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
