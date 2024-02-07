# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/channels/edit', type: :view do
  let(:channel) do
    create(:channel)
  end

  before(:each) do
    assign(:channel, channel)
  end

  it 'renders the edit admin_channel form' do
    render

    assert_select 'form[action=?][method=?]', admin_channel_path(channel), 'post' do
      assert_select 'input[name=?]', 'channel[twitch_id]'
    end
  end
end
