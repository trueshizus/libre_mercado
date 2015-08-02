class ListingsController < ApplicationController
  before_action :listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /listings
  # GET /listings.json
  def index

    @my_listings = current_user.listings if current_user.present?

    if params[:tag_list].present?
      @all_listings = Listing.tagged_with(params[:tag_list].split(',')).page params[:page]
    else
      @all_listings = Listing.all.page params[:page]
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @offers_for_listing = listing.offers.where(status: [:read, :accepted]).page params[:page]
    listing.offers.pending.each do |offer|
      offer.update_attributes!(status: :read)
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    listing
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.create(listing_params.merge(user: current_user))
    if params[:listing][:files].present?
      params[:listing][:files].each do |file|
        Picture.create(picture: file, imageable: @listing)
      end
    end
    redirect_to listings_path
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    if params[:listing][:files].present?
      params[:listing][:files].each do |file|
        Picture.create(picture: file, imageable: listing)
      end
    end
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def listing
    @listing ||= Listing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:title, :description, :tag_list)
  end
end
