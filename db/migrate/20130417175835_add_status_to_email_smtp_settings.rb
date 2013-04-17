class AddStatusToEmailSmtpSettings < ActiveRecord::Migration
  def change
    add_column :email_smtp_settings, :status, :boolean
  end
end
