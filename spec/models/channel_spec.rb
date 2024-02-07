# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:channel)).to be_valid }
  end
end
