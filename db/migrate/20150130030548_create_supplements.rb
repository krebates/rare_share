class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string  :title
      t.text    :description
      t.string  :link
      t.integer :community_id
      t.timestamps
    end
  end
end
