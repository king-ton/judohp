# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    last_name "MyString"
    first_name "MyString"
    gender false
    birth_date "2014-03-26"
    birth_place "MyString"
    street "MyString"
    zip 1
    city "MyString"
    user_id 1
  end
end
