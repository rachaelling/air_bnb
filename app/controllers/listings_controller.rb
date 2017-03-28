class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy ]

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      flash[:notice] = "Your listing has been created"
      redirect_to root_path
    else
      flash[:error] = "Error in creating listing"
      render "listings/new"
    end
  end

  def index
    @listings = current_user.listings
  end

  def show
    #@listings = current_user.listings
  end

  def edit
    # @listing = Listing.find(params[:id])
  end

  def update
    # @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Listing Updated!"
      redirect_to listings_path
    else
      flash[:error] = "Error in updating listing"
      render "listings/edit"
    end
  end

  def destroy
    # @listing = Listing.find(pa  rams[:id])
    @listing.destroy
    redirect_to root_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :location, :description, :available_from, :available_to, :capacity)
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
