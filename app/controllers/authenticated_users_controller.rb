# frozen_string_literal: true

class AuthenticatedUsersController < ApplicationController
  before_action :authenticate_user!
end
