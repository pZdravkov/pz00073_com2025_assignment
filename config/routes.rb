Rails.application.routes.draw do

  get '/library', to: 'library#show'

  get 'sessions/new'

  root 'main_pages#home'

  get '/help', to: 'main_pages#help'

  get '/about', to: 'main_pages#about'

  get '/contact', to: 'main_pages#contact'
  
  get '/signup', to: 'users#new'
  
  get '/signin', to: 'sessions#new'

  post '/signup', to: 'users#create'
  
  post '/signin', to: 'sessions#create'
  
  post '/add', to: 'library#create'
  
  delete '/signout', to: 'sessions#destroy'
  
  resources :users
  
  resources :songs
  
  resources :user_libraries
  
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
