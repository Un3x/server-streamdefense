# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/show', type: :view do
  before(:each) do
    assign(:user, User.create!(
                    email: 'Email',
                    twitch_id: 'Twitch',
                    nickname: 'Nickname',
                    role: 'Role'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Twitch/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Role/)
  end
end
