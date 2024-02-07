# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/channels/new', type: :view do
  before(:each) do
    assign(:channel, build(:channel))
  end

  it 'renders new admin_channel form' do
    render

    assert_select 'form[action=?][method=?]', admin_channels_path, 'post' do
      assert_select 'input[name=?]', 'channel[twitch_id]'
    end
  end
end
