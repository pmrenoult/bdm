class AddUserIdToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :user_id, :integer
    add_index :annonces, :user_id
  end
end
