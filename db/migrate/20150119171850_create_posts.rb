class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.references :user
      t.references :discussion 
    end
  end
end
