class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :customer_id
      t.integer :account_number
      t.string :bank_name

      t.timestamps
    end
  end
end
