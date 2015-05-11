class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
