class CreateRegisteredUsersCabs < ActiveRecord::Migration
  def change
    create_table :registered_users_cabs do |t|
      t.integer :userID
      t.timestamps
    end
  end
end
