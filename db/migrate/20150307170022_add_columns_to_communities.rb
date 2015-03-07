class AddColumnsToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :prevalence, :integer
    add_column :communities, :cause, :string
    add_column :communities, :diagnosis, :string
  end
end
