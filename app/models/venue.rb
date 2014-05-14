class Venue < ActiveRecord::Base
  has_many :competition_templates
  has_many :competitions
end
