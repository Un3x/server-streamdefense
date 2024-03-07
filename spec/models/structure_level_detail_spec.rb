# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StructureLevelDetail, type: :model do
  describe 'has a valid factory' do
    it { expect(build(:structure_level_detail)).to be_valid }
  end
end
