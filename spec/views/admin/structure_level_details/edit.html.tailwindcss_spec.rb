# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/edit', type: :view do
  let(:structure_level_detail) do
    create(:structure_level_detail)
  end

  before(:each) do
    assign(:structure_level_detail, structure_level_detail)
  end

  it 'renders the edit admin_structure_level_detail form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_level_detail_path(structure_level_detail), 'post' do
      assert_select 'select[name=?]', 'structure_level_detail[structure_id]'

      assert_select 'input[name=?]', 'structure_level_detail[level]'

      assert_select 'input[name=?]', 'structure_level_detail[description]'
    end
  end
end
