class UserMailer < ActionMailer::Base
  #default from:  "test@emailwebapp.com"

  def send_mail(email)

    emailer_name = email.email_to.split("@")
    email_with_name = "'#{emailer_name[0]}' <#{email.email_to}>"
    attachments["#{email.email_attachment_file_name}"] = File.read(email.email_attachment.path) if email.email_attachment.present?
    @msg_body = email.email_body

    if $user.present?
      with_custom_smtp_settings do
        mail(:to => email_with_name, :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
      end
    else
      mail(:to => email_with_name, :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
    end

  end



  def self.smtp_settings
    #options = YAML.load_file("#{Rails.root}/config/mailers.yml")[Rails.env]['exception_notifier']
    @@smtp_settings = {
        :address => $user.first.address,
        :port => $user.first.port.to_i,
        :domain => $user.first.domain,
        :user_name => $user.first.user_name,
        :password => $user.first.password,
        :authentication => $user.first.authentication,
        :enable_starttls_auto => true
    }  if $user.present?
  end
  # Override the deliver! method so that we can reset our custom smtp server settings
  def deliver!(mail = @mail)
    out = super
    reset_smtp_settings if @_temp_smtp_settings
    out
  end

  private

  def with_custom_smtp_settings(&block)
    @_temp_smtp_settings = smtp_settings
    @@smtp_settings = smtp_settings
    yield
  end

  def reset_smtp_settings
    @@smtp_settings = @_temp_smtp_settings
    @_temp_smtp_settings = nil
  end

end
