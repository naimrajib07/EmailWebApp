class CreateEmailLists < ActiveRecord::Migration
  def change
    create_table :email_lists do |t|
      t.integer :email_id
      t.string :email_address, :limit => 100
      t.timestamps
    end
  end
end
