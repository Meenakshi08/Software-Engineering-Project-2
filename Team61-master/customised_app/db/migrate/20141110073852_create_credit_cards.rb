class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :customer_id
      t.integer :card_number
      t.date :expiry
      t.string :owner_name

      t.timestamps
    end
  end
end
