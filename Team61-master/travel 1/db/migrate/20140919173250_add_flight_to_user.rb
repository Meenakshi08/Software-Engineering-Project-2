class AddFlightToUser < ActiveRecord::Migration
  def change
    add_column :users, :flight, :boolean, :default=>false
  end
end
