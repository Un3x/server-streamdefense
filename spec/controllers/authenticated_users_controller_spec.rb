# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticatedUsersController, type: :controller do
  controller do
    def index
      head :ok
    end
  end

  describe 'when user is not logged in' do
    it 'redirects to root path' do
      get :index

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'when user is authenticated' do
    let!(:user) { create(:user) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    it 'renders the index template' do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
