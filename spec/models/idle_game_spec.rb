# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IdleGame, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:idle_game)).to be_valid }
  end
end
