class AddReferencesToProducts < ActiveRecord::Migration
  def change
    add_column :offers, :product_id, :integer, null: true
    add_column :products, :user_id, :integer, null: false
  end
end
