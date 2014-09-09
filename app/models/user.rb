# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  password_digest  :string(255)
#  remember_token   :string(255)
#  activation_token :string(255)
#  activated        :boolean
#

require 'bcrypt'

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :members
  belongs_to :person
  
  accepts_nested_attributes_for :person
  
  # Name
  validates :person, presence: true

  # E-Mail
  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Passwort
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, :unless => :update_and_blank_password?
  validates :password_confirmation, presence: true, :unless => :update_and_blank_password?

  # Erinnerungs-Token
  before_save :create_remember_token
  
  # Aktivierungs-Code
  before_create :create_activation_token

  def to_s
    person ? (person.name + " (" + email + ")") : email
  end
  
  def active_members
    Member.where("user_id = #{id} AND (members.exit IS NULL OR members.exit >= '#{Date.today}')").order(:member_number)
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
  def create_activation_token
    self.activation_token = SecureRandom.urlsafe_base64
  end
  
  def update_and_blank_password?
    !(self.new_record?) && self.password.blank? && self.password_confirmation.blank?
  end
end
