class AddStatusToOfferAndListing < ActiveRecord::Migration
  def change
    add_column :listings, :status, :integer
    add_column :offers, :status, :integer
  end
end
