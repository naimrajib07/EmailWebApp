class CreateEmailSmtpSettings < ActiveRecord::Migration
  def change
    create_table :email_smtp_settings do |t|
      t.text :address
      t.integer :port
      t.text :domain
      t.text :user_name
      t.text   :password
      t.text  :authentication
      t.integer :user_id

      t.timestamps
    end
  end
end
