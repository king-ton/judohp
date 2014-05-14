# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  gender      :boolean
#  birth_date  :date
#  birth_place :string(255)
#  street      :string(255)
#  zip         :integer
#  city        :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  nationality :string(255)
#

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
