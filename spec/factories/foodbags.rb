FactoryBot.define do
  factory :foodbag do
    pickup_time { 1 }
    status { 1 }
    association :donor
  end
end
