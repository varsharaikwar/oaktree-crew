Rails.application.routes.draw do
 
  devise_for :users
  ActiveAdmin.routes(self)
  
  authenticated :user, ->(u) { u.has_role?(:sales_person) } do
    root to: "leads#index", as: :sales_person_root
  end

  root to: "candidates#index"

  resources :candidates
  resources :leads 
  resources :password_resets
  resources :notifications
  resources :skill_sets
  get 'show/states', to: "candidates#show_states", as: 'show_states'
  get 'show/cities', to: "candidates#show_cities", as: 'show_cities'
  get 'logout/candidates', to: 'candidates#logout'
  get 'filter/candidates', to: 'candidates#filter'
  get ':category_name', to: 'candidates#skill', as: 'skill_candidates'


  resources :candidates do 
    member do 
      resources :comments
    end
  end
end

