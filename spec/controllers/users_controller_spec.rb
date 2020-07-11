require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  fixtures :users
  let(:user) { User.create!(name: 'First', email: 'test@example.com') }
  let!(:user_params) do
    user_params = { name: 'username',
                    email: 'user@factory.com' }
  end

  describe 'GET #new' do
    it 'gives the user show page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a user ' do
      post :create, params: { user: user_params }
      expect(assigns(:user)).to be_persisted
    end
  end
end
