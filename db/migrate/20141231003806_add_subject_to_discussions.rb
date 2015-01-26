class AddSubjectToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :subject, :string
  end
end
