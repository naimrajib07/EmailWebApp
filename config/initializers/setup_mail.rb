require "development_mail_interceptor"

#ActionMailer::Base.smtp_settings = {
#    :address => "traderline.pt",
#    :port => 25,
#    :domain => "www.traderline.pt",
#    :user_name => "newsletter@traderline.pt",
#    :password => "jc%5I988",
#    :authentication => :login,
#    :enable_starttls_auto => true
#}

#ActionMailer::Base.smtp_settings = {
#    :address => "smtp.gmail.com",
#    :port => 587,
#    :domain => "www.nascenia.com",
#    :user_name => "do-not-reply@nascenia.com",
#    :password => "12nascenia3",
#    :authentication => "plain",
#    :enable_starttls_auto => true
#}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

