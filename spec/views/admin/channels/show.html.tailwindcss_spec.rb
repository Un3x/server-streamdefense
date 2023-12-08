# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/channels/show', type: :view do
  before(:each) do
    assign(:channel, Channel.create!(
                       twitch_id: 'Twitch'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Twitch/)
  end
end
