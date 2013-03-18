class EmailList < ActiveRecord::Base
  attr_accessible :email_address, :email_id

  belongs_to :email
end
