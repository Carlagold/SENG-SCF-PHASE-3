class CreateAccountsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.string :label
      t.string :account_type
      t.integer :user_id
      t.integer :bank_id
    end
  end
end
