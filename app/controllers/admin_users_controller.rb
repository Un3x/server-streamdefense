# frozen_string_literal: true

class AdminUsersController < AuthenticatedUsersController
  before_action :admin?

  def admin?
    redirect_to root_path unless current_user.admin?
  end
end
