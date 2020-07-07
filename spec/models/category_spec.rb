require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:priority) }
  end

  describe 'associations' do
    it { should have_many(:article_categories).with_foreign_key(:category_id) }
    it { should have_many(:articles).through(:article_categories) }
  end

  describe 'orders articles order' do
    it 'orders articles in decending order' do
      user =  User.create!(name: 'pamla', email: 'pamla@example.com') 
      article2 = Article.create!(title: 'Newbashasnjas', text: 'ashshnasnjads@example.com', author_id: user.id)
      article1 = Article.create!( title: 'dnaknkaakj', text: 'jsjhbasbhahs@example.com', author_id: user.id)
      category = Category.create!(name: 'Test', priority: 3, user_id: user.id)
        ArticleCategory.create!(article: article1, category: category)
        ArticleCategory.create!(article: article2, category: category)
        expect(category.latest_article).not_to eql([article2, article1])
      end
  end
end
