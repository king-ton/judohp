class Person < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |a| a[:name].blank? && a[:number].blank? }, :allow_destroy => true
  
  belongs_to :user
  
  def name
    "#{first_name} #{last_name}"
  end
end
