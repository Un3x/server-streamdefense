# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_resources/show', type: :view do
  before(:each) do
    assign(:idle_game_resource, create(:idle_game_resource))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
