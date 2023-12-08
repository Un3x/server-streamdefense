# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/resources/new', type: :view do
  before(:each) do
    assign(:resource, Resource.new(
                        name: 'MyString'
                      ))
  end

  it 'renders new admin_resource form' do
    render

    assert_select 'form[action=?][method=?]', admin_resources_path, 'post' do
      assert_select 'input[name=?]', 'resource[name]'
    end
  end
end
