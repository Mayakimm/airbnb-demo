class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.integer :limit_guests
      t.string :photos
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
