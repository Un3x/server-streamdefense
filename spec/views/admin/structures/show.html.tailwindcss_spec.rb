# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/structures/show', type: :view do
  before(:each) do
    assign(:structure, create(:structure))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
