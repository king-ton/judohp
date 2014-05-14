require 'spec_helper'

include ApplicationHelper

def sign_in_admin
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

def sign_in_user
  user = FactoryGirl.create(:user_member)
  sign_in user
end

def sign_in(user)
  visit signin_path
  fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
  fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
  click_button I18n.t('views.session.new.action')
end