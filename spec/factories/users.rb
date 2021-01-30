FactoryBot.define do
  factory :user do
    email { "user_becomes#{rand(0..999)}@donor.com" }
    password { '123456' }
    password_confirmation { '123456' }
    company_name { 'Netto' }
    adress { 'Mangovägen 22' }
    zipcode { '41522' }
    city { 'Kiruna' }
    
    factory :donor do
      role { :donor }
    end
  end
end
