class Competition < ActiveRecord::Base
  belongs_to :competition_template
  belongs_to :venue
end
