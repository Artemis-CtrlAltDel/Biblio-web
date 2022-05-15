Rails.application.routes.draw do
  resources :adherents
  resources :auteurs
  resources :documents
  resources :materiels

  get '/signup' => 'adherents#new'
  post '/signup' => 'adherents#create'
  get '/login' => 'adherentsessions#new'
  post '/sessions' => 'adherentsessions#create'
  delete "/logout" => "adherentsessions#destroy"

  post '/adherents/:id/admin' => 'adherents#grant_admin'

  post '/materiels/:id/emprunter' => 'materiels#emprunter_materiel'
  post '/materiels/:id/rendre' => 'materiels#rendre_materiel'

  resources :publics
  root 'publics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
