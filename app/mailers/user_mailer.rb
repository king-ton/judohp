class UserMailer < ActionMailer::Base
  default from: "JudoHP <judohp@tonifreitag.de>"
  
  def welcome_email(user)
    @user = user
    mail to: @user.email
  end
end
