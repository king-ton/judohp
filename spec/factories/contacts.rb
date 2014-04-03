# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    person_id 1
    name "MyString"
    number "MyString"
  end
end
