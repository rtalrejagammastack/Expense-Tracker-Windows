class AddNullTrueToTransactions < ActiveRecord::Migration[6.1]
  def up
    change_column_null :transactions, :payer_id, true
    change_column_null :transactions, :receiver_id, true
  end
  def down 
    change_column_null :transactions, :payer_id, false
    change_column_null :transactions, :receiver_id, false
  end
end
