# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/resources/show', type: :view do
  before(:each) do
    assign(:resource, Resource.create!(
                        name: 'Name'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
