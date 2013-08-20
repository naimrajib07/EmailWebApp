class UserMailer < ActionMailer::Base
  #default from:  "test@emailwebapp.com"

  def send_mail(email, user)

    if user.present?
      setting = get_current_user_active_smtp_setting(user)

      if setting.present?
        @@current_user_settings =   {
            :address => setting.address,
            :port => setting.port.to_i,
            :domain => setting.domain,
            :user_name => setting.user_name,
            :password => setting.password,
            :authentication => setting.authentication,
            :enable_starttls_auto => true
        }
      else
        @@current_user_settings = {}
      end
    end

    emailer_name = email.email_to.split("@")
    email_with_name = "'#{emailer_name[0]}' <#{email.email_to}>"
    attachments["#{email.email_attachment_file_name}"] = File.read(email.email_attachment.path) if email.email_attachment.present?
    @msg_body = email.email_body

    if @@current_user_settings.present?
      with_custom_smtp_settings do
        mail(:to => email_with_name, :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
      end
    else
      mail(:to => email_with_name, :from => email.email_from, :bcc => email.bcc, :subject => email.email_subject)
    end

  end


  def get_current_user_active_smtp_setting(user)
      user.email_smtp_settings.active_setting.first
  end



  def self.smtp_settings
    #options = YAML.load_file("#{Rails.root}/config/mailers.yml")[Rails.env]['exception_notifier']
    if @@current_user_settings.present?
      @@smtp_settings = {
          :address => @@current_user_settings[:address],
          :port => @@current_user_settingst[:port].to_i,
          :domain => @@current_user_settings[:domain],
          :user_name =>@@current_user_settings[:user_name],
          :password => @@current_user_settings[:password],
          :authentication => @@current_user_settings[:authentication],
          :enable_starttls_auto => true
      }
    else
      @@smtp_settings = {
          :address => "traderline.pt",
          :port => 25,
          :domain => "www.traderline.pt",
          :user_name => "newslettertest@traderline.pt",
          :password => "news2013letter",
          :authentication => :login,
          :enable_starttls_auto => true
      }

    end

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
