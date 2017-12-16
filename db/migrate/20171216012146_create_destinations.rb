class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
