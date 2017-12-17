class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
      t.bigint :population
      t.timestamps
    end
  end
end
