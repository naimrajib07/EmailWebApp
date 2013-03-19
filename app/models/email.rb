class Email < ActiveRecord::Base

  has_many :email_lists, :dependent => :destroy
  belongs_to :user

  attr_accessible :email_body, :email_from, :email_subject, :email_to, :sender_id, :bcc

  attr_accessor :bcc

  #def bcc=(bcc_email)
  #
  #  bcc_emails =  bcc_email.split(",")
  #  bcc_emails
  #end

end
