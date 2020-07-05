FactoryBot.define do
  factory :category do
    name { 'Sample' }
    priority { 1 }
    user_id {User.first.id}
  end
end
