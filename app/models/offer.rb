class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  has_many :pictures, as: :imageable
  enum status: [:pending, :accepted, :rejected]
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
