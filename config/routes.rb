Rails.application.routes.draw do
 
  devise_for :users
  ActiveAdmin.routes(self)
  
  root "homes#index"

  resources :candidates 
  resources :password_resets
  
  get 'show/states', to: "candidates#show_states", as: 'show_states'
  get 'show/cities', to: "candidates#show_cities", as: 'show_cities'
  get 'logout/candidates', to: 'candidates#logout'
  get 'filter/candidates', to: 'candidates#filter'

  resources :candidates do 
    member do 
      resources :comments
    end
  end
end

