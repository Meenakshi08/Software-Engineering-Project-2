class AddCabToUser < ActiveRecord::Migration
  def change
    add_column :users, :cab, :boolean, :default=>false
  end
end
