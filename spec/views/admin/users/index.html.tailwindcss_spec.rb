# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               email: 'Email',
               twitch_id: 'Twitch',
               nickname: 'Nickname',
               role: 'Role'
             ),
             User.create!(
               email: 'Email2',
               twitch_id: 'Twitch',
               nickname: 'Nickname',
               role: 'Role'
             )
           ])
  end

  it 'renders a list of admin/users' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Twitch'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Nickname'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Role'.to_s), count: 2
  end
end
