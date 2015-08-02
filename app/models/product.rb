class Product < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
