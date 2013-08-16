class UserController < ApplicationController

	before_filter :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end
end
