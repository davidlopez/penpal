FactoryBot.define do
  factory :journal_entry do
    entry { Faker::Lorem.paragraphs }
  end
end
