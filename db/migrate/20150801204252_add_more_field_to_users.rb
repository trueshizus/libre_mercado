class AddMoreFieldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :places, :string
  	add_column :users, :direction, :string
  	add_column :users, :telephone, :string
  end
end
