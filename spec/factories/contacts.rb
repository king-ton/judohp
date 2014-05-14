# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  name       :string(255)
#  number     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    person_id 1
    name "MyString"
    number "MyString"
  end
end
