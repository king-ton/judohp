# == Schema Information
#
# Table name: competition_templates
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  short_name :string(255)
#  venue_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class CompetitionTemplate < ActiveRecord::Base
  belongs_to :venue
  
  has_many :competitions
end
