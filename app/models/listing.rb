class Listing < ActiveRecord::Base
  belongs_to :user, presence:  true
  has_many :offers
end
