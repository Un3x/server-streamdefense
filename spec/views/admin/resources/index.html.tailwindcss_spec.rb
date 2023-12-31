# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/resources/index', type: :view do
  before(:each) do
    assign(:resources, [
             Resource.create!(
               name: 'Name'
             ),
             Resource.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of admin/resources' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
