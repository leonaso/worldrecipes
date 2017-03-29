Rails.application.routes.draw do

  root 'pages#home'
  #root 'pages#welcome'
  get 'pages/home', to: 'pages#home'
  #get 'pages/welcome', to: 'pages#welcome'

  resources :recipes do
    resources :comments, only: [:create]
    member do
      post 'like'
    end  
  end
  
  get '/signup', to: 'chefs#new'
  
  resources :chefs, except: [:new]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :ingredients
  
  mount ActionCable.server => '/cable'
  
  get '/chat', to: 'chatrooms#show'
  
  resources :messages, only: [:create]
  
end
