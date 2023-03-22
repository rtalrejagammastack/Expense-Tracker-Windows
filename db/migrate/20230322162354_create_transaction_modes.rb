class CreateTransactionModes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
