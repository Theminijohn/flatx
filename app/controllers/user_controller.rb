class UserController < ApplicationController

	before_filter :authenticate_user!, only: :show

  def show
    @user = User.includes(:listings).find(params[:id])
    @listings = @user.map(&:listings)
  end
end
