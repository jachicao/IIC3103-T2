Rails.application.routes.draw do
  resources :users
  #resources :usuario, controller: 'users'

  get '/usuario/', to: 'users#index'
  put '/usuario/', to: 'users#create'
  get '/usuario/:user_id', to: 'users#show'
  post '/usuario/:user_id', to: 'users#update'
  delete '/usuario/:user_id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
