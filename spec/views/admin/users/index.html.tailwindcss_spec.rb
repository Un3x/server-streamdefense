# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/index', type: :view do
  before(:each) do
    assign(:users, [create(:user), create(:user)])
  end

  it 'renders a list of admin/users' do
    render
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Twitch'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Nickname'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Role'.to_s), count: 1
  end
end
