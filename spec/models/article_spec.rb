require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(2000).with_message('2000 characters in comment is the maximum allowed.') }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:article_categories) }
    it { should have_many(:categories).through(:article_categories) }
    it { should have_many(:votes) }
  end

  describe '#Articles order' do
    it 'returns first 100 most recent articles' do
      expect(Article.most_recent.count).to_not eql(101)
    end

    it 'returns the most famous article' do
      expect(Article.most_famous.count).to eql(0)
      expect(Article.most_famous.count).to_not eql(2)
    end
  end
end
