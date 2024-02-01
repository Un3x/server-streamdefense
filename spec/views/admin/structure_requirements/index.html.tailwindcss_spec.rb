# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_requirements/index', type: :view do
  before(:each) do
    assign(:structure_requirements, [
             StructureRequirement.create!(
               structure: Structure.create!(
                 name: 'Name',
                 description: 'Description'
               ),
               required_structure: Structure.create!(
                 name: 'Name',
                 description: 'Description'
               ),
               required_level: 1
             ),
             StructureRequirement.create!(
               structure: Structure.create!(
                 name: 'Name',
                 description: 'Description'
               ),
               required_structure: Structure.create!(
                 name: 'Name',
                 description: 'Description'
               ),
               required_level: 1
             )
           ])
  end

  it 'renders a list of admin/structure_requirements' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('^Structure'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Required Structure'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Level'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
