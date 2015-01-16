class CreateMoneyTransactions < ActiveRecord::Migration
  def change
    create_table :money_transactions do |t|
      t.integer :amount
      t.integer :booking_id
      t.integer :payment_source_id

      t.timestamps
    end
  end
end
