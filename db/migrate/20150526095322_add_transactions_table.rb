class AddTransactionsTable < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :sender_account_id
      t.integer :receiver_account_id
 
      t.timestamps null: false
    end
  end
end
