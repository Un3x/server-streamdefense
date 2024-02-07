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

RSpec.describe '/idle_game_structures', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # IdleGameStructure. As you add validations to IdleGameStructure, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      idle_game_id: idle_game.id,
      structure_id: structure.id
    }
  end

  let(:invalid_attributes) do
    {
      idle_game_id: nil,
      structure_id: nil
    }
  end

  let!(:user) { create(:user, role: 'ADMIN') }
  let!(:idle_game) { create(:idle_game) }
  let!(:structure) { create(:structure) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      IdleGameStructure.create! valid_attributes
      get admin_idle_game_structures_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      idle_game_structure = IdleGameStructure.create! valid_attributes
      get admin_idle_game_structure_url(idle_game_structure)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_idle_game_structure_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      idle_game_structure = IdleGameStructure.create! valid_attributes
      get edit_admin_idle_game_structure_url(idle_game_structure)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new IdleGameStructure' do
        expect do
          post admin_idle_game_structures_url, params: { idle_game_structure: valid_attributes }
        end.to change(IdleGameStructure, :count).by(1)
      end

      it 'redirects to the created idle_game_structure' do
        post admin_idle_game_structures_url, params: { idle_game_structure: valid_attributes }
        expect(response).to redirect_to(admin_idle_game_structure_url(IdleGameStructure.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new IdleGameStructure' do
        expect do
          post admin_idle_game_structures_url, params: { idle_game_structure: invalid_attributes }
        end.to change(IdleGameStructure, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_idle_game_structures_url, params: { idle_game_structure: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:idle_game2) { create(:idle_game) }
      let(:new_attributes) do
        {
          idle_game_id: idle_game2.id
        }
      end

      it 'updates the requested idle_game_structure' do
        idle_game_structure = IdleGameStructure.create! valid_attributes
        patch admin_idle_game_structure_url(idle_game_structure), params: { idle_game_structure: new_attributes }
        idle_game_structure.reload
        expect(idle_game_structure.idle_game_id).to eq(idle_game2.id)
      end

      it 'redirects to the idle_game_structure' do
        idle_game_structure = IdleGameStructure.create! valid_attributes
        patch admin_idle_game_structure_url(idle_game_structure), params: { idle_game_structure: new_attributes }
        idle_game_structure.reload
        expect(response).to redirect_to(admin_idle_game_structure_url(idle_game_structure))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        idle_game_structure = IdleGameStructure.create! valid_attributes
        patch admin_idle_game_structure_url(idle_game_structure), params: { idle_game_structure: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested idle_game_structure' do
      idle_game_structure = IdleGameStructure.create! valid_attributes
      expect do
        delete admin_idle_game_structure_url(idle_game_structure)
      end.to change(IdleGameStructure, :count).by(-1)
    end

    it 'redirects to the idle_game_structures list' do
      idle_game_structure = IdleGameStructure.create! valid_attributes
      delete admin_idle_game_structure_url(idle_game_structure)
      expect(response).to redirect_to(admin_idle_game_structures_url)
    end
  end
end
