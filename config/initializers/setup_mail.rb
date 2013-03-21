require "development_mail_interceptor"

ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "www.nascenia.com",
    :user_name => "do-not-reply@nascenia.com",
    :password => "12nascenia3",
    :authentication => "plain"
}

Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?