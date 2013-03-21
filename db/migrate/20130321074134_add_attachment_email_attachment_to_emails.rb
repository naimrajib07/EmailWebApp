class AddAttachmentEmailAttachmentToEmails < ActiveRecord::Migration
  def self.up
    change_table :emails do |t|
      t.attachment :email_attachment
    end
  end

  def self.down
    drop_attached_file :emails, :email_attachment
  end
end
