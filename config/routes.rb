Rails.application.routes.draw do
  
  get '/genres/action', to: 'genres#action' # it should be written first so that resources :genres, :index doesn't overwrite this custom route
  get '/genres/drama', to: 'genres#drama'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  
  resources :users do
    resources :movies
  end
  
  resources :users, only: [:index, :new, :create, :show]
  resources :genres
  resources :artists
  resources :movies

  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
