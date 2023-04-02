class AddProfileImageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile_image, :attachment
    add_column :user_categories, :background, :attachment
    add_column :transactions, :documents, :attachment
  end
end
