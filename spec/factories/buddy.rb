FactoryBot.define do
  factory :buddy do
    association :user
    email { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    phone_number { '1234567890' }
  end
end
