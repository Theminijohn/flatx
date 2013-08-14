class ListingsController < ApplicationController

	# In Rails 4 before_filter was changed to before_action and must set before the set_listing Action
	before_action :authenticate_user!, except: [:index]
	before_action :set_listing, only: [:show, :edit, :update, :destroy]


	# GET /listings
	# GET /listings.json
	def index
		@listings = Listing.order("created_at desc")
	end

	# GET /listings/1
	# GET /listings/1.json
	def show
	end

	# GET /listings/new
	def new
		@listing = current_user.listings.build
	end

	# GET /listings/1/edit
	def edit
		@pin = current_user.listings.find(params[:id])
	end

	# POST /listings
	# POST /listings.json
	def create
		@listing = current_user.listings.build(listing_params)

		respond_to do |format|
			if @listing.save
				format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
				format.json { render action: 'show', status: :created, location: @listing }
			else
				format.html { render action: 'new' }
				format.json { render json: @listing.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /listings/1
	# PATCH/PUT /listings/1.json
	def update
		respond_to do |format|
			if @listing.update(listing_params)
				format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @listing.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /listings/1
	# DELETE /listings/1.json
	def destroy
		@listing.destroy
		respond_to do |format|
			format.html { redirect_to listings_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_listing
		@listing = Listing.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def listing_params
		params.require(:listing).permit(:title, :description, :image, :price)
	end
end