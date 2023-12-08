# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structures/new', type: :view do
  before(:each) do
    assign(:structure, Structure.new(
                         name: 'MyString',
                         description: 'MyString'
                       ))
  end

  it 'renders new admin_structure form' do
    render

    assert_select 'form[action=?][method=?]', admin_structures_path, 'post' do
      assert_select 'input[name=?]', 'structure[name]'

      assert_select 'input[name=?]', 'structure[description]'
    end
  end
end
