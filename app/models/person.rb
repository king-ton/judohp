class Person < ActiveRecord::Base
  belongs_to :user
  
  def name
    "#{first_name} #{last_name}"
  end
end
