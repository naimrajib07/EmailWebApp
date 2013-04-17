class Email < ActiveRecord::Base

  has_many :email_lists, :dependent => :destroy
  belongs_to :user

  attr_accessible :email_body, :email_from, :email_subject, :email_to, :sender_id, :bcc, :email_attachment, :email_attachment_file_name

  attr_accessor :bcc


  validates_presence_of :email_body, :email_from, :email_subject


  has_attached_file :email_attachment






end
