class AddProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :description, null: false, default: ""
    end
  end
end
