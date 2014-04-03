class Contact < ActiveRecord::Base
  belongs_to :person
  
  validates :name, :presence => true
  validates :number, :presence => true
  validates :person_id, :presence => true
end
