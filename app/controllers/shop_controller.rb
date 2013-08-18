class ShopController < ApplicationController

	before_filter :authenticate_user!, only: :show

	def show
		@user = User.find_by_name(params[:id]) # for name instead of id
		@listings = @user.listings
	end

end
