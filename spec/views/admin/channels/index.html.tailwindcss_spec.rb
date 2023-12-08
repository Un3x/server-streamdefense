# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/channels/index', type: :view do
  before(:each) do
    assign(:channels, [
             Channel.create!(
               twitch_id: 'Twitch'
             ),
             Channel.create!(
               twitch_id: 'Twitch'
             )
           ])
  end

  it 'renders a list of admin/channels' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Twitch'.to_s), count: 2
  end
end
