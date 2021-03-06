# == Schema Information
#
# Table name: members
#
#  id               :integer          not null, primary key
#  member_number    :string(255)
#  entry            :date
#  exit             :date
#  entry_federation :date
#  exit_federation  :date
#  person_id        :integer
#  dad_id           :integer
#  mum_id           :integer
#  created_at       :datetime
#  updated_at       :datetime
#
class Member < ActiveRecord::Base
  belongs_to :person
  belongs_to :mum,    class_name: "Person"
  belongs_to :dad,    class_name: "Person"
  belongs_to :user
  
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :user

  validates   :person,        :presence => true
  #validates   :user,          :presence => true
  validates   :member_number, :presence => true, format: { with: /\A\d{4}-\d{3}\z/ }, :uniqueness => true
  validates   :entry,         :presence => true
  validate    :exit_after_entry

  def active?
    self.exit == nil or self.exit >= Date.today ? true : false
  end
  
  def to_s
    "#{person.name} (#{member_number})"
  end
  
  def state
    if self.exit
      if self.exit < Date.today
        return I18n.t(:label_member_inactive)
      else
        return I18n.t(:label_member_warning)
      end
    else
      return I18n.t(:label_member_active)
    end
  end
  
  def state_class
    if self.exit
      if self.exit < Date.today
        return 'danger'
      else
        return 'warning'
      end
    else
      return 'success'
    end
  end

  private

  def exit_after_entry
    errors.add(:exit, I18n.t('activerecord.errors.models.member.attributes.exit.before_entry')) if exit && entry && exit < entry
    errors.add(:exit_federation, I18n.t('activerecord.errors.models.member.attributes.exit.before_entry')) if exit_federation && entry_federation && exit_federation < entry_federation
  end
end
