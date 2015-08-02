class AddTitleToProductAndAddTitleToOffer < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    add_column :offers, :title, :string
  end
end
