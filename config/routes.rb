Rails.application.routes.draw do
  resources :stocks, only: [:index, :show, :new, :create, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create, :update]
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
end
