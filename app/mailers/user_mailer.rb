class UserMailer < ActionMailer::Base
  #default from:  "test@emailwebapp.com"



  def send_mail(email)
    emailer_name = email.email_to.split("@")
    email_with_name = "'#{emailer_name[0]}' <#{email.email_to}>"
    attachments["#{email.email_attachment_file_name}"] = File.read(email.email_attachment.path) if email.email_attachment.present?
    @msg_body = email.email_body
    mail(:to => email_with_name, :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
  end
end
