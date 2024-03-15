# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:season)).to be_valid }
  end
end
