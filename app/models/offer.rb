class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  enum status: [:pending, :accepted, :rejected]
end
