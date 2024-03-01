# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Import method for resources and structures', type: :request do
  let!(:user) { create(:user, role: 'ADMIN') }

  before do
    sign_in user
  end

  before :each do
    @resources_file = fixture_file_upload('resources.csv', 'text/csv')
    @structures_file = fixture_file_upload('structures.csv', 'text/csv')
    @structure_requirements_file = fixture_file_upload('structure_requirements.csv', 'text/csv')
    @structure_formulas_file = fixture_file_upload('structure_formulas.csv', 'text/csv')
  end

  it 'can upload all files' do
    expect do
      post import_admin_resources_url, params: { file: @resources_file }, headers: { 'HTTP_REFERER' => admin_resources_url }
    end.to change(Resource, :count).by(3)

    expect do
      post import_admin_structures_url, params: { file: @structures_file }, headers: { 'HTTP_REFERER' => admin_structures_url }
    end.to change(Structure, :count).by(5)

    expect do
      post import_admin_structure_requirements_url, params: { file: @structure_requirements_file }, headers: { 'HTTP_REFERER' => admin_structure_requirements_url }
    end.to change(StructureRequirement, :count).by(4)

    expect do
      post import_admin_structure_formulas_url, params: { file: @structure_formulas_file }, headers: { 'HTTP_REFERER' => admin_structure_formulas_url }
    end.to change(StructureFormula, :count).by(35)
  end
end
