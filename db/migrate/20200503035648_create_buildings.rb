class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.integer :type
      t.string :identifier
      t.string :name

      t.timestamps
    end
  end
end
