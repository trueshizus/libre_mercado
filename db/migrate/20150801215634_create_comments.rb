class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :comments, :ancestry
  end
end
