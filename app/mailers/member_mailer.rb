class MemberMailer < ActionMailer::Base
  default from: "JudoHP <judohp@tonifreitag.de>"
  
  def new_member(member)
    @member = member
    mail(to: member.person.user.email, subject: 'Mitgliedschaft bei Testus e.V.')
  end
end
