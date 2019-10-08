Rails.application.routes.draw do
  get "tourist_areas/index"
  root "pages#home"
  get  "/help",    to: "pages#help"
  get  "/about",   to: "pages#about"
  get  "/contact", to: "pages#contact"
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :categories, only: :show
  resources :tourist_areas, only: [:show, :index]
end
