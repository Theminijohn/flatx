class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception



	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:name, :email, :password, :password_confirmation, :provider, :uid, :first_name, :last_name)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:name, :email, :password, :current_password, :password_confirmation, :first_name, :last_name, :user_bio,
							 :country, :gender, :facebook_link, :twitter_link, :pinterest_link, :provider, :uid, :avatar)
		end
	end

end
