class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :terms, :boolean
    add_column :users, :role, :integer
  end
end
