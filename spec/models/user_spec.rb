require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email)}
    it { should allow_value('test@test.com').for(:email) }
  end
  
  describe 'associations' do
    it { should have_many(:votes) }
    it { should have_many(:created_articles).class_name('Article').with_foreign_key(:author_id) }
  end
end