Rails.application.routes.draw do
 
  devise_for :users
  ActiveAdmin.routes(self)
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  # root :to => redirect("/users/sign_in")
  # get 'index/homes', to: 'homes#index'

  resources :candidates 
  get 'show/cities', to: "candidates#show_cities", as: 'show_cities'
  get 'logout/candidates', to: 'candidates#logout'
end
