class CreateServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :service_records do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
