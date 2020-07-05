FactoryBot.define do
  factory :article do
    author_id { User.first.id }
    sequence(:title) { |n| "Title#{n}" }
    sequence(:text) { |n| "Content#{n}" }
  end
end
