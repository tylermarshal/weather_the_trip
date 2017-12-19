class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :destination, foreign_key: true
      t.references :trip, foreign_key: true
    end
  end
end
