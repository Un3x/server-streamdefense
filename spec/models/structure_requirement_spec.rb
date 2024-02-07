# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StructureRequirement, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:structure_requirement)).to be_valid }
  end
end
