class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :users, :direction, :address
  end
end
