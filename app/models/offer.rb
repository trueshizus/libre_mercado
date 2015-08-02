class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  enum status: [:pending, :read, :accepted, :rejected]

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
