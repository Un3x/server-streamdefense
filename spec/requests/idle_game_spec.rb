# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Idle controller', type: :request do
  subject { get idle_game_state_path, params: }

  before do
    Timecop.freeze(Time.local(1990))
  end

  after do
    Timecop.return
  end

  describe 'GET idle_game_state_path' do
    let!(:user) { create(:user, nickname: 'test', twitch_id: '1234321') }
    let!(:channel) { create(:channel, twitch_id: '4321234') }
    let!(:idle_game) { IdleGameFactory.new(user, channel).perform }

    describe 'when there are missing parameters' do
      describe 'when there are no parameters' do
        let(:params) { {} }

        it 'returns http 422' do
          subject

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe 'when there are viewer_id is missing parameters' do
        let(:params) { { channel_id: 1, viewer_display_name: 'test' } }

        it 'returns http 422' do
          subject

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe 'when there channel_id is missing' do
        let(:params) { { viewer_id: 1, viewer_display_name: 'test' } }
        it 'returns http 422' do
          subject

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'when there are all parameters' do
      let(:params) { { channel_id: 1000, viewer_id: 1000, viewer_display_name: 'test' } }

      describe 'when the user and the channel and the game do not exist' do
        it 'creates a new channel, a new user and a new idle game' do
          expect do
            subject
          end.to change { Channel.count }.by(1)
                                         .and change { User.count }.by(1)
                                                                   .and change { IdleGame.count }.by(1)

          expect(response).to have_http_status(:success)
        end
      end

      describe 'when the user and the channel already exist' do
        let(:params) { { channel_id: '4321234', viewer_id: '1234321', viewer_display_name: user.nickname } }

        it 'returns http success' do
          subject

          expect(response).to have_http_status(:success)
        end

        it 'returns the game state' do
          Timecop.freeze(Time.now + 5.seconds)
          subject

          expect(response).to have_http_status(:success)

          expect(response.body).to include('status')

          expect(JSON.parse(response.body)['data']['time_since_last_sync']).to eq(5)

          expect(JSON.parse(response.body)['data']['resources']).to eq(
            JSON.parse(
              '{
                "Bois":{
                    "amount":0,
                    "rate": 0,
                    "storage": 101
                },
                "Nourriture":{
                    "amount":0,
                    "rate": 0,
                    "storage": 101
                },
                "Fer":{
                    "amount":0,
                    "rate": 0,
                    "storage": 101
                }
              }'
            )
          )

          expect(JSON.parse(response.body)['data']['structures']['Hotel de ville']).not_to be_nil
          expect(JSON.parse(response.body)['data']['structures']['Ferme']).not_to be_nil
          expect(JSON.parse(response.body)['data']['structures']['Scierie']).not_to be_nil
          expect(JSON.parse(response.body)['data']['structures']['Camp militaire']).not_to be_nil
        end
      end
    end
  end
end
