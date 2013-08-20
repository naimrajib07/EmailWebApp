require "development_mail_interceptor"

#ActionMailer::Base.smtp_settings = {
#    :address => "traderline.pt",
#    :port => 25,
#    :domain => "www.traderline.pt",
#    :user_name => "newslettertest@traderline.pt",
#    :password => "news2013letter",
#    :authentication => :login,
#    :enable_starttls_auto => true
#}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

