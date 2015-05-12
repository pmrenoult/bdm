class AddTitleToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :name, :string
  end
end
