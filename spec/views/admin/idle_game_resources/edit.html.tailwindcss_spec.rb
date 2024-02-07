# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_resources/edit', type: :view do
  let(:idle_game_resource) do
    create(:idle_game_resource)
  end

  before(:each) do
    assign(:idle_game_resource, idle_game_resource)
  end

  it 'renders the edit admin_idle_game_resource form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_game_resource_path(idle_game_resource), 'post' do
      assert_select 'input[name=?]', 'idle_game_resource[idle_game_id]'

      assert_select 'input[name=?]', 'idle_game_resource[resource_id]'

      assert_select 'input[name=?]', 'idle_game_resource[quantity]'
    end
  end
end
