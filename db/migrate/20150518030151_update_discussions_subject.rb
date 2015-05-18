class UpdateDiscussionsSubject < ActiveRecord::Migration
  def change
    change_column :discussions, :subject, :text
  end
end
