class AddAuthorToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :user_id, :integer
    add_column :discussions, :created_at, :datetime
    add_column :discussions, :updated_at, :datetime
  end
end
