
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StructureFormula, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:linear_formula, :with_production)).to be_valid }
    it { expect(build(:exponential_formula, :with_production)).to be_valid }
    it { expect(build(:linear_percentage_formula, :with_production)).to be_valid }
  end
end
