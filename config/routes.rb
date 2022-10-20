Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    get 'search', to: 'search#sweets' # Search
    resources :admins # Admins
    resources :subjects # Categories
    resources :sweets # Doces
  end

  devise_for :users
  devise_for :admins, skip: [:registrations]
  
  get 'inicio' => 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
