class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :is_owner, :boolean
  end
end
