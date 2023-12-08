# frozen_string_literal: true

class AuthenticatedUsersController < ApplicationController
  layout 'users'

  before_action :authenticate_user!
end
