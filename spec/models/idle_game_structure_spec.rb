# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IdleGameStructure, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:idle_game_structure)).to be_valid }
  end
end
