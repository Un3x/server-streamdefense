# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_resources/index', type: :view do
  before(:each) do
    assign(:idle_game_resources, [
             IdleGameResource.create!(
               idle_game: IdleGame.create!(
                 channel: Channel.create!(twitch_id: 'MyString'),
                 user: create(:user)
               ),
               resource: Resource.create!(
                 name: 'MyString'
               ),
               quantity: 1
             ),
             IdleGameResource.create!(
               idle_game: IdleGame.create!(
                 channel: Channel.create!(twitch_id: 'MyString'),
                 user: create(:user, email: 'juste1@unex.com')
               ),
               resource: Resource.create!(
                 name: 'MyString'
               ),
               quantity: 1
             )
           ])
  end

  it 'renders a list of admin/idle_game_resources' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 6
  end
end
