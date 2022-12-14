Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "welcome#index"
  get "my_portfolio", to: "users#my_portfolio"
  get "search_stock", to: "stocks#search_stock"
  get "my_stocks", to: "users#my_stocks"
  get "new_stock", to: "stocks#new"
  get "my_friends", to: "users#my_friends"
  resources :user_stocks
  resources :friendship, only: [:show]
end
