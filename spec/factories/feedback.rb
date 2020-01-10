FactoryBot.define do
  factory :feedback do
    helpful { true }
    again { false }
    shift { true }
    activity { 'swimming' }
  end
end
