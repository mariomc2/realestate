class CreateManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :managements do |t|
      t.integer :role
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
