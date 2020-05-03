class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :type
      t.string :identifier
      t.belongs_to :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
