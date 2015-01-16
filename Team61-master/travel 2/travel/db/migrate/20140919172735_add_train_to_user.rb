class AddTrainToUser < ActiveRecord::Migration
  def change
    add_column :users, :train, :boolean, :default=>false
  end
end
