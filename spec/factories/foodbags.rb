FactoryBot.define do
  factory :foodbag do
    pickuptime { :morning }
    status { :available }
    association :donor, factory: :donor
    # association :recipient, factory: :recipient
  end
end
