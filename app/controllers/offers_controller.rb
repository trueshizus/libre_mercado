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
    @offer = Offer.new(listing_id: params[:listing])
  end

  # GET /offers/1/edit
  def edit
  end

  def accept
    offer.update_attributes!(status: :accepted)
    redirect_to listings_path
  end

  def reject
    offer.update_attributes!(status: :rejected)
    redirect_to listings_path
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params.merge(user: current_user, listing_id: params[:listing_id],
                       status: :pending))
    listing = Listing.find(params[:listing_id])
    UserMailer.new_offer_email(listing.user).deliver_later
    uploader = PictureUploader.new
    params[:offer][:files].each do |file|
      Picture.create(picture: file, imageable: @offer)
    end

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def offer
    @offer ||= Offer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:offer).permit(:description, :price, :user_id, :listing_id, :status)
  end
end
