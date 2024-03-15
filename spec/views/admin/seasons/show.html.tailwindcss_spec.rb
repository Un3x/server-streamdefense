# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/seasons/show', type: :view do
  before(:each) do
    assign(:season, create(:season))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Speed/)
    expect(rendered).to match(/Active/)
  end
end
