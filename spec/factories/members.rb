# == Schema Information
#
# Table name: members
#
#  id               :integer          not null, primary key
#  member_number    :string(255)
#  entry            :date
#  exit             :date
#  entry_federation :date
#  exit_federation  :date
#  person_id        :integer
#  dad_id           :integer
#  mum_id           :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

#FactoryGirl.define do
#  factory :member do
#    member_number "MyString"
#    entry "2014-04-03"
#    exit "2014-04-03"
#    entry_federation "2014-04-03"
#    exit_federation "2014-04-03"
#    person_id 1
#    dad_id 1
#    mum_id 1
#  end
#end
