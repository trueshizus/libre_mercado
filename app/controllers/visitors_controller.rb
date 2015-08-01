class VisitorsController < ApplicationController
  def index
    @my_listings = current_user.listings.page params[:page] if current_user.present?
    @my_offers = current_user.offers.page params[:page] if current_user.present?
    @all_listings = Listing.all.page params[:page]
  end
end
