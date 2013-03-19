class UserMailer < ActionMailer::Base
  #default from:  "naim@nascenia.com"

  def send_mail(email)
    #email_with_name = "#{to.name} <#{to.email}>"
    @msg_body = email.email_body
    mail(:to =>"#{email.email_to}", :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
  end
end
