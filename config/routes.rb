Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :update]
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
end
