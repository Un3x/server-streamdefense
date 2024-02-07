# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/show', type: :view do
  before(:each) do
    assign(:user, create(:user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Twitch/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Role/)
  end
end
