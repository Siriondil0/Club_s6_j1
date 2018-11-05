Rails.application.routes.draw do
  resources :registrations
  resources :logins
  resources :users 
  get '/secret', to: 'users#secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
