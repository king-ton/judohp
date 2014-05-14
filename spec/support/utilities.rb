include ApplicationHelper

def sign_in_admin
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

def sign_in(user)
  #puts '######################'
  #puts user.id
  #request.session[:user] = user.id
  #puts request.session[:user]
  #visit signin_path
  #fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
  #fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
  #click_button I18n.t('views.session.new.action')
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end