class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :description
      t.float :price
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
