Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  
  resources :payments
  resources :expenses 
  resources :users, except: [:index, :destroy]
  
end
