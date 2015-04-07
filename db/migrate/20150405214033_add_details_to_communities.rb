class AddDetailsToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :symptom, :text
    add_column :communities, :diagnostic_test, :text
    add_column :communities, :treatment, :text
    add_column :communities, :prognosis, :text
    add_column :communities, :tip, :text
    add_column :communities, :expanded_description, :text
  end
end
