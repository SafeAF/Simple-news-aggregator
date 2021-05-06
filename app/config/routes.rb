Rails.application.routes.draw do

  get "u/:username" => "profile#index", as: :profile
 
  resources :posts do
    member do
      put 'like' => 'posts#like'
    end

  	resources :comments do
          member do
           put 'like' => 'comments#like'
    end
  	 resources :replies
         member do
          put 'like' => 'replies#like'
    end
	 end
  end

  resources :comments
  resources :replies 
  devise_for :users, controllers: { registrations: "registrations"}
  resources :users, only: [:show]
  get "/users/:id/posts", to: "posts#user", as: "users_posts"
  get "/users/:id/comments", to: "comments#user", as: "users_comments"
  get "/users/:id/replies", to: "replies#user", as: "users_replies"
  post "flagged/:id", to: "flagged#create", as: "flagged"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
