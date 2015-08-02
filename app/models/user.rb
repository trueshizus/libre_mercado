class User < ActiveRecord::Base
  has_many :offers
  has_many :listings
  has_many :products

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def can_offer?(listing)
    !Offer.find_by(user: self, listing: listing).present?
  end
end
