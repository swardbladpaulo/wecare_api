FactoryBot.define do
  factory :user do
    email {"donor@donor.com"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end
