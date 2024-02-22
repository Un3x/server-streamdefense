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
                    "perSecond": 0,
                    "storage": 101
                },
                "Nourriture":{
                    "amount":0,
                    "perSecond": 0,
                    "storage": 101
                },
                "Fer":{
                    "amount":0,
                    "perSecond": 0,
                    "storage": 101
                }
              }'
            )
          )

          expect(JSON.parse(response.body)['data']['structures']).to eq(
            JSON.parse(
              '{
                "Hotel de ville":{
                  "name":"Hotel de ville",
                  "description":"Ceci est un hotel de ville",
                  "level":0,
                  "visible":false,
                  "requires":[

                  ],
                  "levelUp":{
                    "duration":6,
                    "costs":{
                        "Nourriture":1,
                        "Bois":1
                    }
                  },
                  "production":{
                    "Bois":0,
                    "Nourriture":0,
                    "Fer":0
                  },
                  "storage":{
                    "Bois":101,
                    "Nourriture":101,
                    "Fer":101
                  }
              },
              "Ferme":{
                  "name":"Ferme",
                  "description":"Ceci est une ferme",
                  "level":0,
                  "visible":false,
                  "requires":[

                  ],
                  "levelUp":{
                    "duration":6,
                    "costs":{
                        "Nourriture":1,
                        "Bois":1
                    }
                  },
                  "production":{
                    "Nourriture":0
                  },
                  "storage":{

                  }
              },
              "Scierie":{
                  "name":"Scierie",
                  "description":"Ceci est un scierie",
                  "level":0,
                  "visible":false,
                  "requires":[

                  ],
                  "levelUp":{
                    "duration":6,
                    "costs":{
                        "Nourriture":1,
                        "Bois":1
                    }
                  },
                  "production":{
                    "Bois":0
                  },
                  "storage":{

                  }
              },
              "Camp militaire":{
                  "name":"Camp militaire",
                  "description":"Ceci est un camp militaire",
                  "level":0,
                  "visible":false,
                  "requires":[
                    {
                        "name":"Scierie",
                        "level":2
                    },
                    {
                        "name":"Ferme",
                        "level":2
                    }
                  ],
                  "levelUp":{
                    "duration":6,
                    "costs":{
                        "Nourriture":1,
                        "Bois":1
                    }
                  },
                  "production":{
                    "Bois":0
                  },
                  "storage":{
                  }
                }
              }'
            )
          )
        end
      end
    end
  end
end
