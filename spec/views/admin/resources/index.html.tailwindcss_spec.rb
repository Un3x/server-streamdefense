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
    cell_selector = 'tr>th'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Action'.to_s), count: 1
  end
end
