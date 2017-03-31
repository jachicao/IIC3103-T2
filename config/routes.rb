Rails.application.routes.draw do
  resources :users
  #resources :usuario, controller: 'users'

  get '/usuario/', to: 'users#index'
  put '/usuario/', to: 'users#create'
  get '/usuario/:id', to: 'users#show'
  post '/usuario/:id', to: 'users#update'
  delete '/usuario/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
