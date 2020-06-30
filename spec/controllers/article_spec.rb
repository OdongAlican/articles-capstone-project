require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
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
end
