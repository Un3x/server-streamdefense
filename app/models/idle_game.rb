# frozen_string_literal: true

class IdleGame < ApplicationRecord
  belongs_to :channel
  belongs_to :user
end
