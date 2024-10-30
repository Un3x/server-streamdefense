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

  let!(:season) { create(:season, active: true) }
  let!(:structure) { create(:structure, key: 'struct', season:) }
  let!(:resource) { create(:resource, key: 'food', season:) }

  let!(:structure_production) { create(:linear_formula, :with_production, structure:, resource:) }
  let!(:structure_storage) { create(:linear_formula, :with_storage, structure:, resource:, intercept: 100) }
  let!(:structure_duration) { create(:linear_formula, :with_duration, structure:) }
  let!(:structure_cost) { create(:linear_formula, :with_cost, structure:, resource:) }

  describe 'GET idle_game_state_path' do
    before do
      IdleGameConfiguration.instance.reload
    end

    let!(:user) { create(:user, nickname: 'test', twitch_id: '1234321') }
    let!(:channel) { create(:channel, twitch_id: '666') }
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

      before do
        IdleGameConfiguration.instance.reload
      end

      describe 'when the user and the channel already exist' do
        let(:params) { { channel_id: '666', viewer_id: '1234321', viewer_display_name: user.nickname } }

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
          expect(JSON.parse(response.body)['data']['resources'][resource.key]['rate']).to eq(structure_production.calculate(0))
          expect(JSON.parse(response.body)['data']['resources'][resource.key]['amount']).to eq(structure_production.calculate(0) * 5)
          expect(JSON.parse(response.body)['data']['resources'][resource.key]['storage']).to eq(structure_storage.calculate(0))
          expect(JSON.parse(response.body)['data']['structures'][structure.key]['level_up']['duration']).to eq(structure_duration.calculate(0))
          expect(JSON.parse(response.body)['data']['structures'][structure.key]['level_up']['costs'][resource.key]).to eq(structure_cost.calculate(0))
          expect(JSON.parse(response.body)['data']['structures'][structure.key]['visible']).to be(true)
        end
      end
    end
  end
end
