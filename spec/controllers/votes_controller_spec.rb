require 'rails_helper'
RSpec.describe VotesController, type: :controller do
  let(:current_user) { User.create!(name: 'test', email: 'test@example.com') }

  def login(user)
    session[:user_id] = user.id
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @article = Article.create!(title: 'Sample test', text: 'Sample test', author_id: @user.id,
                                      image: fixture_file_upload('spec/fixtures/articl.png', 'image/png'))
    login(@user)
  end

  describe 'liking and disliking a post' do
    it 'vote an article' do
      post :create, params: { article_id: @article.id, user_id: @user.id }
      expect(response).to redirect_to(articles_path)
      expect(flash[:notice]).to eql('You voted a article.')
    end

    it 'downvote an post' do
      post :create, params: { article_id: @article.id, user_id: @user.id }
      expect(response).to redirect_to(articles_path)
      expect(flash[:notice]).to eql('You voted a article.')
      delete :destroy, params: { id: Article.all[0].id, article_id: @article.id, user_id: @user.id }
      expect(response).to redirect_to(articles_path)
      expect(flash[:notice]).to match('You downvoted a article.')
    end
  end
end
