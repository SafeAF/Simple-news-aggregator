Rails.application.routes.draw do

  get "u/:username" => "profile#index", as: :profile
 
  resources :posts do
  	resources :comments do
  		resources :replies
	end
  end

  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
