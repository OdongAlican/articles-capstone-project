require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @article = Article.create!(title: 'Sample test', text: 'Sample test', author_id: @user.id,
                                      image: fixture_file_upload('spec/fixtures/articl.png', 'image/png'))
    login(@user)
  end

  let(:user) { FactoryBot.create(:user, name: 'test', email: 'test@example.com') }
  let(:current_user) { user }
  let(:category) { Category.create!(name: 'First Category', priority: 1, user_id: user.id) }
  let(:category_params) do
    category_params = { name: 'Second Category',
                        priority: 2 }
  end

  describe 'GET #index' do
    it 'gets all the categories and render index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #new' do
    it 'gives the categories show page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'shows a category show page' do
      get :show, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates an category ' do
      post :create, params: { category: category_params }
      expect(assigns(:category)).to be_persisted
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a Category' do
      category = FactoryBot.create(:category)
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end
  end
end
