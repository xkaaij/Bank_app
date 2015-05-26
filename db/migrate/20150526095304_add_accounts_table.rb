class AddAccountsTable < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :amount
      t.integer :user_id
 
      t.timestamps null: false
    end
  end
end
