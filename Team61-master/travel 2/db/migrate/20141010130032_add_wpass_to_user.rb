class AddWpassToUser < ActiveRecord::Migration
  def change
    add_column :users, :wpass, :string
  end
end
