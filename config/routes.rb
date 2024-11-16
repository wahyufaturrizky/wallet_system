Rails.application.routes.draw do
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/wallets/transfer', to: 'wallets#transfer'
end
