# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TradeRequest, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:trade_request)).to be_valid }
  end
end
