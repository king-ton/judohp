class CompetitionTemplate < ActiveRecord::Base
  belongs_to :venue
  
  has_many :competitions
end
