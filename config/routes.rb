Flat::Application.routes.draw do

  get "shop/show"
  resources :categories
	root :to => "listings#index"

  get "user/show"
  resources :listings

	get "flatuipro_demo/index"

	devise_for :users, :controllers => { :registrations => "registrations",
																			 :omniauth_callbacks => "users/omniauth_callbacks" },
						 :path => '', :path_names => {:sign_in => 'signin'} # Redirect from users/sign_in to /signin
	get 'users/:id' => 'user#show', as: :user
	get 'shops/:id' => 'shop#show', as: :shop

	resources :messages, only: [:index, :create, :new] do
		member do
			get :inbox
			get :sent
		end
	end

end
