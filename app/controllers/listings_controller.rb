class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy ]

  def index
    @listings = Listing.order(:title).page params[:page]
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      flash[:success] = "Your listing has been created"
      redirect_to root_path
    else
      flash[:error] = "Error in creating listing"
      render "listings/new"
    end
  end

  def show
    @reservation = @listing.reservations.new
  end

  def edit
    # @listing = Listing.find(params[:id])
  end

  def update
    # @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:success] = "Successfully updated the listing!"
      redirect_to root_path
    else
      flash[:error] = "Error in updating listing"
      render "listings/edit"
    end
  end

  def destroy
    # @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to root_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :location, :description, :available_from, :available_to, :capacity, {photos: []})
  end


  def find_listing
    @listing = Listing.find(params[:id])
  end

end
