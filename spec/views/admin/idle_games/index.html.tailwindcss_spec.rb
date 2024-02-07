# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_games/index', type: :view do
  before(:each) do
    assign(:idle_games, [create(:idle_game), create(:idle_game)])
  end

  it 'renders a list of admin/idle_games' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Channel'), count: 1
    assert_select cell_selector, text: Regexp.new('Player'), count: 1
    assert_select cell_selector, text: Regexp.new('Action'), count: 1
  end
end
