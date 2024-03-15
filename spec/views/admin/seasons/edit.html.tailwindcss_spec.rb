# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/seasons/edit', type: :view do
  let(:season) do
    create(:season)
  end

  before(:each) do
    assign(:season, season)
  end

  it 'renders the edit admin_season form' do
    render

    assert_select 'form[action=?][method=?]', admin_season_path(season), 'post' do
      assert_select 'input[name=?]', 'season[name]'

      assert_select 'input[name=?]', 'season[speed]'

      assert_select 'input[name=?]', 'season[active]'
    end
  end
end
