class EmailSmtpSetting < ActiveRecord::Base
  attr_accessible :address, :domain, :port, :user_name, :password, :authentication, :user_id, :status

  belongs_to :user

  scope :active_setting, where(:status => true)

  AUTHENTICATION = ['plain', 'login']
end
