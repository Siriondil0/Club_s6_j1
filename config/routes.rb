Rails.application.routes.draw do
  root to: 'users#index'
  resources :registrations
  resources :logins
  resources :users 
  get '/club', to: 'users#fight_club'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
