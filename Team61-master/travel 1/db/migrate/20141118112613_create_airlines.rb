class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.integer :user_id
      t.string :airline_name

      t.timestamps
    end
  end
end
