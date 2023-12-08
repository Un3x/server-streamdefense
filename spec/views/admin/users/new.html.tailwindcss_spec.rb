# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    email: 'MyString',
                    twitch_id: 'MyString',
                    nickname: 'MyString',
                    role: 'MyString'
                  ))
  end

  it 'renders new admin_user form' do
    render

    assert_select 'form[action=?][method=?]', admin_users_path, 'post' do
      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[twitch_id]'

      assert_select 'input[name=?]', 'user[nickname]'

      assert_select 'input[name=?]', 'user[role]'
    end
  end
end
