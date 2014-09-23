class MemberMailer < ActionMailer::Base
  default from: "JudoHP <judohp@tonifreitag.de>"
  
  def new_member(member)
    @member = member
    mail to: @member.user.email
  end
end
