class AddTypeToUserAttachments < ActiveRecord::Migration
  def change
    add_column :user_attachments, :attachment_type, :string
  end
end
