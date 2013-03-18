class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.string :email_to, :limit => 100
      t.string :email_from, :limit => 100
      t.text :email_subject
      t.text :email_body

      t.timestamps
    end
  end
end
