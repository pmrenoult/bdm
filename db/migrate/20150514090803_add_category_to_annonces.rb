class AddCategoryToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :category_id, :string
  end
end
