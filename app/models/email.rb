class Email < ActiveRecord::Base
  attr_accessible :email_body, :email_from, :email_subject, :email_to, :sender_id

  has_many :email_lists, :dependent => :destroy
  belongs_to :user
end
