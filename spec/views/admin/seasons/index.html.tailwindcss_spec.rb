# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/seasons/index', type: :view do
  before(:each) do
    assign(:seasons, [create(:season), create(:season)])
  end

  it 'renders a list of admin/seasons' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Speed'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Active'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
