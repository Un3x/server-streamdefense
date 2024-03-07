# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structure_level_details/show', type: :view do
  before(:each) do
    assign(:structure_level_detail, create(:structure_level_detail))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
  end
end
