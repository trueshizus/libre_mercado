class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  enum status: [:pending, :read, :accepted, :rejected, :not_accepted]

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true

  before_create :add_status

  def add_status
    self.status ||= 0
  end
end
