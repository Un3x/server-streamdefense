# frozen_string_literal: true

class AdminUserController < AuthenticatedUserController
  before_action :admin?

  def admin?
    redirect_to root_path unless current_user.admin?
  end
end
