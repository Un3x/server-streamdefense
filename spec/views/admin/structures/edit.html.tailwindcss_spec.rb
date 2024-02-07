# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structures/edit', type: :view do
  let(:structure) do
    create(:structure)
  end

  before(:each) do
    assign(:structure, structure)
  end

  it 'renders the edit admin_structure form' do
    render

    assert_select 'form[action=?][method=?]', admin_structure_path(structure), 'post' do
      assert_select 'input[name=?]', 'structure[name]'

      assert_select 'input[name=?]', 'structure[description]'
    end
  end
end
