# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/seasons/new', type: :view do
  before(:each) do
    assign(:season, build(:season))
  end

  it 'renders new admin_season form' do
    render

    assert_select 'form[action=?][method=?]', admin_seasons_path, 'post' do
      assert_select 'input[name=?]', 'season[name]'

      assert_select 'input[name=?]', 'season[speed]'

      assert_select 'input[name=?]', 'season[active]'
    end
  end
end
