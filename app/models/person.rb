# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  gender      :boolean
#  birth_date  :date
#  birth_place :string(255)
#  street      :string(255)
#  zip         :integer
#  city        :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  nationality :string(255)
#

class Person < ActiveRecord::Base
  before_destroy :check_person_is_member

  has_many :contacts, :dependent => :destroy
  has_many :members
  has_many :mums, :class_name => 'Member'
  has_many :dads, :class_name => 'Member'
  
  belongs_to :user
  
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |a| a[:name].blank? && a[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :user
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  
  
  def name
    "#{first_name} #{last_name}"
  end

  private

  def check_person_is_member
    status = true
    if self.members.count > 0
      self.errors[:deletion_status] = I18n.t('activerecord.errors.models.person.has_member')
    status = false
    end
    status
  end
end
