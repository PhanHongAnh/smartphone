Rails.application.routes.draw do

  get '/reviews', to: 'page#render_page'

  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :reviews
  resources :users
  resources :products
  resources :makers

end
