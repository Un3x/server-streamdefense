# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/new', type: :view do
  before(:each) do
    assign(:structure_level_detail, StructureLevelDetail.new(
                                      structure: nil,
                                      level: 1
                                    ))
  end

  it 'renders new admin_structure_level_detail form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_level_details_path, 'post' do
      assert_select 'input[name=?]', 'admin_structure_level_detail[structure_id]'

      assert_select 'input[name=?]', 'admin_structure_level_detail[level]'
    end
  end
end
