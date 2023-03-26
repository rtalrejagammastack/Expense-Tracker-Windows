class AddColumnsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :payer_name, :string
    add_column :transactions, :receiver_name, :string
  end
end
