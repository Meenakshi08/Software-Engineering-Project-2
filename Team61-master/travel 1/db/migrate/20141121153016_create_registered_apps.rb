class CreateRegisteredApps < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|
      t.string :Name
      t.string :Type
      t.timestamps
    end
  end
end
