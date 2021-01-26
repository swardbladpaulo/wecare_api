FactoryBot.define do
  factory :foodbag do
    pickuptime { :morning }
    status { :available }
    association :donor
  end
end
