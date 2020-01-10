FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    google_token { '123455' }
    spotify_token { '5544321' }
  end
end
