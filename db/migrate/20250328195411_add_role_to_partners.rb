class AddRoleToPartners < ActiveRecord::Migration[7.0]
  def change
    add_column :partners, :role, :string
    add_index :partners, [:user_id, :role], unique: true
  end
end
