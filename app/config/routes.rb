Rails.application.routes.draw do

  get "u/:username" => "profile#index", as: :profile
  resources :replies
  resources :comments
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
