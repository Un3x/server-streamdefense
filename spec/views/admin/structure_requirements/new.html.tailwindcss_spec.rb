# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_requirements/new', type: :view do
  before(:each) do
    assign(:structure_requirement, build(:structure_requirement))
  end

  it 'renders new structure_requirement form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_requirements_path, 'post' do
      assert_select 'select[name=?]', 'structure_requirement[structure_id]'

      assert_select 'select[name=?]', 'structure_requirement[required_structure_id]'

      assert_select 'input[name=?]', 'structure_requirement[required_level]'
    end
  end
end
