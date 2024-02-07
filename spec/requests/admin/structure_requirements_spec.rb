# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/structure_requirements', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # StructureRequirement. As you add validations to StructureRequirement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      structure_id: structure.id,
      required_structure_id: required_structure.id,
      required_level: 1
    }
  end

  let(:invalid_attributes) do
    {
      structure_id: nil,
      required_structure: nil,
      required_level: nil
    }
  end

  let!(:user) { create(:user, role: 'ADMIN') }
  let!(:structure) { create(:structure) }
  let!(:required_structure) { create(:structure) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      StructureRequirement.create! valid_attributes
      get admin_structure_requirements_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      structure_requirement = StructureRequirement.create! valid_attributes
      get admin_structure_requirement_url(structure_requirement)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_structure_requirement_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      structure_requirement = StructureRequirement.create! valid_attributes
      get edit_admin_structure_requirement_url(structure_requirement)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new StructureRequirement' do
        expect do
          post admin_structure_requirements_url, params: { structure_requirement: valid_attributes }
        end.to change(StructureRequirement, :count).by(1)
      end

      it 'redirects to the created structure_requirement' do
        post admin_structure_requirements_url, params: { structure_requirement: valid_attributes }
        expect(response).to redirect_to(admin_structure_requirement_url(StructureRequirement.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new StructureRequirement' do
        expect do
          post admin_structure_requirements_url, params: { structure_requirement: invalid_attributes }
        end.to change(StructureRequirement, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_structure_requirements_url, params: { structure_requirement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          required_level: 2
        }
      end

      it 'updates the requested structure_requirement' do
        structure_requirement = StructureRequirement.create! valid_attributes
        patch admin_structure_requirement_url(structure_requirement), params: { structure_requirement: new_attributes }
        structure_requirement.reload
        expect(structure_requirement.required_level).to eq(2)
      end

      it 'redirects to the structure_requirement' do
        structure_requirement = StructureRequirement.create! valid_attributes
        patch admin_structure_requirement_url(structure_requirement), params: { structure_requirement: new_attributes }
        structure_requirement.reload
        expect(response).to redirect_to(admin_structure_requirement_url(structure_requirement))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        structure_requirement = StructureRequirement.create! valid_attributes
        patch admin_structure_requirement_url(structure_requirement), params: { structure_requirement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested structure_requirement' do
      structure_requirement = StructureRequirement.create! valid_attributes
      expect do
        delete admin_structure_requirement_url(structure_requirement)
      end.to change(StructureRequirement, :count).by(-1)
    end

    it 'redirects to the structure_requirements list' do
      structure_requirement = StructureRequirement.create! valid_attributes
      delete admin_structure_requirement_url(structure_requirement)
      expect(response).to redirect_to(admin_structure_requirements_url)
    end
  end
end
