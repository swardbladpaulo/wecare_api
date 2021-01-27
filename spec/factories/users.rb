FactoryBot.define do
  factory :user do
    name { 'MyString' }
    address { 'MyString' }
    zipcode { 1 }
    city { 'MyString' }
    phonenumber { 1 }

    factory :donor do
      role { :donor }
    end
  end
end
