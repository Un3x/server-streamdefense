# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_requirements/edit', type: :view do
  let(:structure_requirement) do
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
  end

  before(:each) do
    assign(:structure_requirement, structure_requirement)
  end

  it 'renders the edit admin_structure_requirement form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_requirement_path(structure_requirement), 'post' do
      assert_select 'select[name=?]', 'structure_requirement[structure_id]'

      assert_select 'select[name=?]', 'structure_requirement[required_structure_id]'

      assert_select 'input[name=?]', 'structure_requirement[required_level]'
    end
  end
end
