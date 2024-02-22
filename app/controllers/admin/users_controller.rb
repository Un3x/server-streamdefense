# frozen_string_literal: true

module Admin
  class UsersController < AdminUsersController
    before_action :set_user, only: %i[show]

    # GET /admin/users or /admin/users.json
    def index
      @users = User.all
    end

    # GET /admin/users/1 or /admin/users/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  end
end
