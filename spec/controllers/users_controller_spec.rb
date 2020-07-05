require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  fixtures :users
  let(:user)  {User.create!(name: 'First', email: 'test@example.com')}
  let!(:user_params) { user_params = { name: "username",
                                       email: "user@factory.com"
                                      } }

  describe 'GET #index' do
    it 'gets all the users and render index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'gives the user show page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'creates a user and displays users page' do
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a user ' do
      post :create, params: { user: user_params }
      expect(assigns(:user)).to be_persisted
    end
  end

end
