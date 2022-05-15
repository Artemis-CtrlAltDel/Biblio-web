Rails.application.routes.draw do
  resources :adherents
  resources :auteurs
  resources :documents
  resources :materiels

  get '/signup', to: 'adherents#new'
  post '/signup', to: 'adherents#create'
  get '/login', to: 'adherentsessions#new'
  post '/sessions', to: 'adherentsessions#create'
  get "/logout", to: "adherentsessions#destroy"

  resources :publics
  root 'publics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
