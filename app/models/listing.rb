class Listing < ActiveRecord::Base
  belongs_to :user
  validates :user, presence:  true
  has_many :offers

  paginates_per 10

  enum status: [:pending, :rejected, :accepted, :finished, :failed]
end
