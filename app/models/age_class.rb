# == Schema Information
#
# Table name: age_classes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  min_age    :integer
#  max_age    :integer
#  created_at :datetime
#  updated_at :datetime
#

class AgeClass < ActiveRecord::Base
  has_and_belongs_to_many :competitions
end
