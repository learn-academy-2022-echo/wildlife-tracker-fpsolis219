Rails.application.routes.draw do
  resources :animals
  get 'animals' => 'animals#index'
  post 'animals' => 'animals#create'
  delete 'animals/:id' => 'animals#destroy'
end
