# frozen_string_literal: true

# jfrozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/idle_game_resources/new', type: :view do
  before(:each) do
    assign(:idle_game_resource, build(:idle_game_resource))
  end

  it 'renders new admin_idle_game_resource form' do
    render

    assert_select 'form[action=?][method=?]', admin_idle_game_resources_path, 'post' do
      assert_select 'input[name=?]', 'idle_game_resource[idle_game_id]'

      assert_select 'input[name=?]', 'idle_game_resource[resource_id]'

      assert_select 'input[name=?]', 'idle_game_resource[quantity]'
    end
  end
end
