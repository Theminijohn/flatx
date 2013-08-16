Flat::Application.routes.draw do

  resources :categories

  get "user/show"
  resources :listings

	devise_for :users, :controllers => { :registration => "registration", :omniauth_callbacks => "users/omniauth_callbacks" }
	get 'users/:id' => 'user#show', as: :user

  get "flatuipro_demo/index"
	root :to => "listings#index"

	resources :messages, only: [:index, :create, :new] do
		member do
			get :inbox
			get :sent
		end
	end

end
