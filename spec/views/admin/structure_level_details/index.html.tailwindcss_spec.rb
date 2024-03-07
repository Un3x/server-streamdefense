# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/index', type: :view do
  before(:each) do
    assign(:structure_level_details, [
             StructureLevelDetail.create!(
               structure: nil,
               level: 2
             ),
             StructureLevelDetail.create!(
               structure: nil,
               level: 2
             )
           ])
  end

  it 'renders a list of admin/structure_level_details' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
