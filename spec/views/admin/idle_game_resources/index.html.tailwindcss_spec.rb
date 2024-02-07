# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_resources/index', type: :view do
  before(:each) do
    assign(:idle_game_resources, [create(:idle_game_resource), create(:idle_game_resource)])
  end

  it 'renders a list of admin/idle_game_resources' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Idle Game'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Resource'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Quantity'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
