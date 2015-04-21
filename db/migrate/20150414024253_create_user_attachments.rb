class CreateUserAttachments < ActiveRecord::Migration
  def change
    create_table :user_attachments do |t|
      t.string   "avatar",       null: false
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
