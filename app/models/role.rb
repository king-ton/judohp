# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  activities :text
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  before_save { self.activities.reject! { |a| a.empty? }}
  
  has_and_belongs_to_many :users
  
  serialize :activities, Array
  
  # Name
  validates :name, presence: true
end
