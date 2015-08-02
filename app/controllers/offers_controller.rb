class OffersController < ApplicationController
  include Commentable
  before_action :offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @listing = Listing.find(params[:listing])
    @offer = Offer.new(listing_id: params[:listing])
  end

  def new_product
    @offer = Offer.new(listing_id: params[:listing])
    @listing = Listing.find(params[:listing])
  end

  def offer_product
    create_offer
    # debugger
    product = Product.find(params[:product_id])
    offer.update_attributes(description: product.description)
    product.pictures.each do |file|
      Picture.create(picture: file, imageable: offer)
    end
  end

  # GET /offers/1/edit
  def edit
  end

  def accept
    # Change the status of all the other offers
    other_offers = offer.listing.offers
    other_offers.each do |of|
      if of != offer
        of.update_attributes!(status: :not_accepted)
      end
    end
    offer.update_attributes!(status: :accepted)
    UserMailer.accepted_offer_email(offer.user).deliver_later
    # Listin status = pending
    offer.listing.update_attributes!(status: :pending)
  end

  def reject
    offer.update_attributes!(status: :rejected)
    UserMailer.offer_rejected_email(offer, params[:feedback]).deliver_later
    redirect_to listing_path(offer.listing)
  end

  # POST /offers
  # POST /offers.json
  def create
    create_offer
    params[:offer][:files].each do |file|
      Picture.create(picture: file, imageable: offer)
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    offer.update_attributes(offer_params.merge(user: current_user,
                                                 listing_id: params[:listing_id]))
    params[:offer][:files].each do |file|
      Picture.create(picture: file, imageable: offer)
    end
    redirect_to offer_path(offer)
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Oferta eliminada.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def offer
    @offer ||= params[:id].present? ? Offer.find(params[:id]) : Offer.find_by(listing_id: params[:listing_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:offer).permit(:description, :price, :user_id, :listing_id, :status)
  end

  def create_offer
    @offer = Offer.new(offer_params.merge(user: current_user, listing_id: params[:listing_id],
                                          status: :pending))
    listing = Listing.find(params[:listing_id])
    UserMailer.new_offer_email(listing.user).deliver_later

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Oferta creada.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end
end
