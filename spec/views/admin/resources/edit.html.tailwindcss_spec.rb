# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/resources/edit', type: :view do
  let(:resource) do
    create(:resource)
  end

  before(:each) do
    assign(:resource, resource)
  end

  it 'renders the edit admin_resource form' do
    render

    assert_select 'form[action=?][method=?]', admin_resource_path(resource), 'post' do
      assert_select 'input[name=?]', 'resource[name]'
    end
  end
end
