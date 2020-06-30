require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(2000).with_message('2000 characters in comment is the maximum allowed.') }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:article_categories).with_foreign_key(:article_id) }
    it { should have_many(:categories).through(:article_categories) }
    it { should have_many(:votes) }
  end
end
