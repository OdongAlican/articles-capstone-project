FactoryBot.define do
    factory :article do
      user
      sequence(:title) { |n| "Title#{n}" }
      sequence(:text) { |n| "Content#{n}" }
    end
end
