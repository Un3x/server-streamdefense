# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_games/index', type: :view do
  before(:each) do
    assign(:idle_games, [
             IdleGame.create!(
               channel: Channel.create!(twitch_id: 'MyString'),
               user: create(:user)
             ),

             IdleGame.create!(
               channel: Channel.create!(twitch_id: 'MyString'),
               user: create(:user, email: 'juste1@unex.com')
             )
           ])
  end

  it 'renders a list of admin/idle_games' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Channel'), count: 1
    assert_select cell_selector, text: Regexp.new('Player'), count: 1
    assert_select cell_selector, text: Regexp.new('Action'), count: 1
  end
end
