class AddAccountsTable < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :user_id
 
      t.timestamps null: false
    end
  end
end
