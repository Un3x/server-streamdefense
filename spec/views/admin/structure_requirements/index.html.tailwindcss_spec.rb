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
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 6
  end
end
