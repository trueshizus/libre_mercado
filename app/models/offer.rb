class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  enum status: [:pending, :read, :accepted, :rejected]
  has_many :comments, as: :commentable, dependent: :destroy

end
