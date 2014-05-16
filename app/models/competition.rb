class Competition < ActiveRecord::Base  
  belongs_to :competition_template
  belongs_to :venue
  
  has_and_belongs_to_many :age_classes
end
