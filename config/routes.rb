Rails.application.routes.draw do
  resources :sightings
  resources :animals
  get 'animals' => 'animals#index'
  post 'animals' => 'animals#create'
  delete 'animals/:id' => 'animals#destroy'
  post 'sightings/' => 'sightings#create'
  patch 'sightings/:id' => 'sightings#update'
  delete 'sightings/:id' => 'sightings#destroy'
 
end
