class Listing < ActiveRecord::Base
  belongs_to :user
  validates :user, presence:  true
  has_many :offers, dependent: :delete_all
  has_many :pictures, as: :imageable, dependent: :delete_all
  paginates_per 10

  enum status: [:pending, :rejected, :accepted, :finished, :failed]
  accepts_nested_attributes_for :pictures, allow_destroy: true
  acts_as_taggable
end
