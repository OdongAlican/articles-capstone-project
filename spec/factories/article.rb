FactoryBot.define do
  factory :article do
    author_id { User.first.id }
    sequence(:title) { |n| "Title#{n}" }
    sequence(:text) { |n| "Content#{n}" }
    trait :image do
      image { file_fixture('spec/fixtures/articl.png') }
    end
  end
end
