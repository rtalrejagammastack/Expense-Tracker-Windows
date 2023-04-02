class AddProfileImageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar, :attachment
    add_column :user_categories, :background, :attachment
    add_column :transactions, :document, :attachment
  end
end
