# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/new', type: :view do
  before(:each) do
    assign(:structure_level_detail, build(:structure_level_detail))
  end

  it 'renders new admin_structure_level_detail form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_level_details_path, 'post' do
      assert_select 'select[name=?]', 'structure_level_detail[structure_id]'

      assert_select 'input[name=?]', 'structure_level_detail[level]'

      assert_select 'input[name=?]', 'structure_level_detail[description]'
    end
  end
end
