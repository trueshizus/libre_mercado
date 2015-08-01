class Listing < ActiveRecord::Base
  belongs_to :user
  validates :user, presence:  true
  has_many :offers
  has_many :pictures, as: :imageable
  paginates_per 10

  enum status: [:pending, :finished]
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
