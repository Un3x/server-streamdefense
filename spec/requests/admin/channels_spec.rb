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

  let(:invalid_attributes) do
    {
      twitch_id: nil
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

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_channel_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      channel = Channel.create! valid_attributes
      get edit_admin_channel_url(channel)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Channel' do
        expect do
          post admin_channels_url, params: { channel: valid_attributes }
        end.to change(Channel, :count).by(1)
      end

      it 'redirects to the created channel' do
        post admin_channels_url, params: { channel: valid_attributes }
        expect(response).to redirect_to(admin_channel_url(Channel.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Channel' do
        expect do
          post admin_channels_url, params: { channel: invalid_attributes }
        end.to change(Channel, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_channels_url, params: { channel: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          twitch_id: '654321'
        }
      end

      it 'updates the requested channel' do
        channel = Channel.create! valid_attributes
        patch admin_channel_url(channel), params: { channel: new_attributes }
        channel.reload
        expect(channel.twitch_id).to eq('654321')
      end

      it 'redirects to the channel' do
        channel = Channel.create! valid_attributes
        patch admin_channel_url(channel), params: { channel: new_attributes }
        channel.reload
        expect(response).to redirect_to(admin_channel_url(channel))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        channel = Channel.create! valid_attributes
        patch admin_channel_url(channel), params: { channel: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested channel' do
      channel = Channel.create! valid_attributes
      expect do
        delete admin_channel_url(channel)
      end.to change(Channel, :count).by(-1)
    end

    it 'redirects to the channels list' do
      channel = Channel.create! valid_attributes
      delete admin_channel_url(channel)
      expect(response).to redirect_to(admin_channels_url)
    end
  end
end
