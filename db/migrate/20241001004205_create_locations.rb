class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :cleaning_frequency

      t.timestamps
    end
  end
end
