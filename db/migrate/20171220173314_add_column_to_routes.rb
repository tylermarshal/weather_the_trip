class AddColumnToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :created_at, :datetime, null: false
    add_column :routes, :updated_at, :datetime, null: false
  end
end
