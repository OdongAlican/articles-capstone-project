require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
  let(:session) { Session.create!(name: 'First') }
  let!(:session_params) do
    session_params = { name: 'username' }
  end

  describe 'GET #new' do
    it 'gives the login page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'does not creates a session ' do
      post :create, params: { session: session_params }
      expect(assigns(:session)).to be_nil
    end
  end
end
