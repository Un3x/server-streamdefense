# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/edit', type: :view do
  let(:user) do
    User.create!(
      email: 'MyString',
      twitch_id: 'MyString',
      nickname: 'MyString',
      role: 'MyString'
    )
  end

  before(:each) do
    assign(:user, user)
  end

  it 'renders the edit admin_user form' do
    render

    assert_select 'form[action=?][method=?]', admin_user_path(user), 'post' do
      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[twitch_id]'

      assert_select 'input[name=?]', 'user[nickname]'

      assert_select 'input[name=?]', 'user[role]'
    end
  end
end
