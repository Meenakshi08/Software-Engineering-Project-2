class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :display_name
      t.string :name
      t.integer :discount

      t.timestamps
    end
  end
end
