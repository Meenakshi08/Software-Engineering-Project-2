class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.date :dob
    	t.string :agent_id
      	t.string :email
      	t.string :post
      	t.text :address
      	t.integer :contact
      	t.string :username
      	t.string :encrypted_password	
      	t.string :salt
    	

      t.timestamps
    end
  end
end
