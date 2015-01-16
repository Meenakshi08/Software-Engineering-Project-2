class AddBusToUser < ActiveRecord::Migration
  def change
    add_column :users, :bus, :boolean, :default=>false
  end
end
