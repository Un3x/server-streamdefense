# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :rememberable

  has_many :idle_games

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /#{EMAIL_FORMAT_REGEX}/ }

  ROLE_ADMIN = 'ADMIN'
  ROLE_USER = 'USER'

  def admin?
    role == ROLE_ADMIN
  end
end
