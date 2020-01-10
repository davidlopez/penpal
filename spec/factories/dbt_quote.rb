FactoryBot.define do
  factory :dbt_quote do
    quote { Faker::Quote.yoda }
  end
end
