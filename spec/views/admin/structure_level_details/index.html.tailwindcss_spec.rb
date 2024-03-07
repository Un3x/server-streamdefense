# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/index', type: :view do
  before(:each) do
    assign(:structure_level_details, [create(:structure_level_detail), create(:structure_level_detail)])
  end

  it 'renders a list of admin/structure_level_details' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('^Structure'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Level'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
