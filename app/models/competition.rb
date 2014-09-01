# == Schema Information
#
# Table name: competitions
#
#  id                      :integer          not null, primary key
#  title                   :string(255)
#  start_date              :date
#  end_date                :date
#  venue_id                :integer
#  competition_template_id :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class Competition < ActiveRecord::Base  
  belongs_to :competition_template
  belongs_to :venue
  
  has_and_belongs_to_many :age_classes
  
  validates :title, :presence => true
  validates :start_date, :presence => true
end
