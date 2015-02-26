class CreateConnectionsTable < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :connect_id
    end
  end
end
