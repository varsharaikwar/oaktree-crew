Rails.application.routes.draw do
 
  devise_for :users
  ActiveAdmin.routes(self)
  
  authenticated :user, ->(u) { u.has_role?(:sales_person) } do
    root to: "leads#index", as: :sales_person_root
  end
  
  authenticated :user, ->(u) { u.has_role?(:pool_manager) } do
    root to: "interview_schedules#index", as: :pool_manager_root
  end
  
  authenticated :user, ->(u) { u.has_role?(:manager) } do
    root to: "interview_schedules#manager_dashboard", as: :manager_root
  end

  # authenticated :user, ->(u) { u.has_role?(:junior_hr, :senior_hr, :bde) } do
  #   root to: "candidates#index", as: :hr_root
  # end

  root to: "candidates#index"

  resources :candidates
  resources :leads 
  resources :lead_assignments
  resources :password_resets
  resources :notifications
  resources :skill_sets
  resources :interview_schedules, except: [:show]


  resources :candidates do
    member do
      get 'filterd/list', to: 'candidates#list'
      get :duration_filter
    end
  end

  resources :interview_schedules do
    get :manager_dashboard, on: :collection
  end

  resource :leads do 
    collection do
      get 'duration/filter', to: 'leads#duration_filter'
      get 'my/created', to: 'leads#user_leads'
    end
  end
  
  resources :candidates do 
    resources :comments
  end

  get 'show/states', to: "candidates#show_states", as: 'show_states'
  get 'show/cities', to: "candidates#show_cities", as: 'show_cities'
  get 'logout/candidates', to: 'candidates#logout'
  get 'filter/candidates', to: 'candidates#filter'
  get ':category_name', to: 'candidates#skill', as: 'skill_candidates'

end

