# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/channels', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Channel. As you add validations to Channel, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      twitch_id: '123456'
    }
  end

  let!(:user) { create(:user, role: 'ADMIN') }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Channel.create! valid_attributes
      get admin_channels_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      channel = Channel.create! valid_attributes
      get admin_channel_url(channel)
      expect(response).to be_successful
    end
  end
end
