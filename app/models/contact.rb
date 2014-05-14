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

class Contact < ActiveRecord::Base
  belongs_to :person
  
  validates :name, :presence => true
  validates :number, :presence => true
end
