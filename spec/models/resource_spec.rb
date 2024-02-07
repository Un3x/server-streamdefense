# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:resource)).to be_valid }
  end
end
