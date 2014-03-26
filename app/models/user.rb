# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'bcrypt'

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  
  # Name
  validates :name, presence: true

  # E-Mail
  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Passwort
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # Erinnerungs-Token
  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
