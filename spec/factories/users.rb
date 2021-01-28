FactoryBot.define do
  factory :user do
    email {"donor@donor.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
