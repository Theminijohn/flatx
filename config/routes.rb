Flat::Application.routes.draw do

  resources :categories
	root :to => "listings#index"

  get "user/show"
  resources :listings

	get "flatuipro_demo/index"

	devise_for :users, :controllers => { :registrations => "registrations",
																			 :omniauth_callbacks => "users/omniauth_callbacks" },
						 :path => '', :path_names => {:sign_in => 'login'}
	get 'users/:id' => 'user#show', as: :user

	resources :messages, only: [:index, :create, :new] do
		member do
			get :inbox
			get :sent
		end
	end

end
