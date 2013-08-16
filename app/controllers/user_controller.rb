class UserController < ApplicationController
  def show
    @user = User.includes(:listings).find(params[:id])
    @listings = @user.map(&:listings)
  end
end
