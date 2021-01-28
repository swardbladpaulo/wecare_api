FactoryBot.define do
  factory :user do
    email {"donor@donor.com"}
    password {"123456"}
    password_confirmation {"123456"}

    factory :donor do 
    role { :donor }
  end
end
end 
