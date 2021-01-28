FactoryBot.define do
  factory :foodbag do
    pickuptime { :morning }
    status { :available }
    association :donor, factory: :user
  end
end
