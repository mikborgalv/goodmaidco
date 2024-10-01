class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :phone_number
      t.float :rating

      t.timestamps
    end
  end
end
