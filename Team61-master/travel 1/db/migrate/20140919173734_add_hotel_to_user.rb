class AddHotelToUser < ActiveRecord::Migration
  def change
    add_column :users, :hotel, :boolean, :default=>false
  end
end
