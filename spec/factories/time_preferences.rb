FactoryBot.define do
  factory :time_preference do
    morning { false }
    midday { false }
    before_bed { false }
    random { true }
  end
end
