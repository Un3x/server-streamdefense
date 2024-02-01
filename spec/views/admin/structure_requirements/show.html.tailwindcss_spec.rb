# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_requirements/show', type: :view do
  before(:each) do
    assign(:structure_requirement,
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
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
