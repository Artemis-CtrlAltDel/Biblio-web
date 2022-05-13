Rails.application.routes.draw do
  resources :respos
  resources :adherents
  get '/add_adherents' => 'adherents#new', :as => 'add_adherents'
  get '/show_adherents' => 'respos#show_adherents', :as => 'show_adherents'
  resources :auteurs
  get '/add_auteurs' => 'auteurs#new', :as => 'add_auteurs'
  get '/show_auteurs' => 'documents#show_auteurs', :as => 'show_auteurs'
  resources :documents
  get '/add_documents' => 'documents#new', :as => 'add_documents'
  get '/show_documents' => 'respos#show_documents', :as => 'show_documents'
  resources :materiels
  get '/add_materiels' => 'materiels#new', :as => 'add_materiels'
  get '/show_materiels' => 'respos#show_materiels', :as => 'show_materiels'

  resources :publics
  root 'publics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
