class UserMailer < ActionMailer::Base
  default from: "JudoHP <judohp@tonifreitag.de>"
  
  def welcome_email(user, password=nil)
    @user = user
    @url = signin_path
    @password
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
