require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @article = Article.create!(title: 'Sample test', text: 'Sample test', author_id: @user.id,
                               image: fixture_file_upload('spec/fixtures/articl.png', 'image/png'))
    login(@user)
  end

  let(:user) { User.create!(name: 'test', email: 'test@example.com') }
  let(:article) do
    Article.create!(text: 'First Article', title: 'sample test article', author_id: user.id,
                    image: fixture_file_upload('spec/fixtures/articl.png', 'image/png'))
  end
  let!(:article_params) do
    article_params = { text: 'Third Article',
                       title: 'another trial article',
                       image: fixture_file_upload('spec/fixtures/articl.png', 'image/png') }
  end

  describe 'GET #index' do
    it 'gets all the articles and render index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'gives the article show page' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'shows an article show page' do
      get :show, params: { id: article.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates an article ' do
      post :create, params: { article: article_params }
      expect(assigns(:article)).to be_persisted
      expect { delete :destroy, params: { id: article.id } }.to change(Article, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an Article' do
      post :create, params: { article: article_params }
      expect { delete :destroy, params: { id: 1 } }.to change(Article, :count).by(-1)
    end
  end
end
