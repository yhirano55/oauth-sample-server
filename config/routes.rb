Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  use_doorkeeper

  namespace :api, defaults: { format: :json } do
    get '/me', to: 'current_user#show'
  end

  get 'auth/doorkeeper/callback', to: 'callbacks#handle'
end
