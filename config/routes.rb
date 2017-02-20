Rails.application.routes.draw do
  resources :notes
  resources :offers
  resources :tasks
  resources :projects
  resources :contacts
  resources :companies

  resources :authorizations, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get '*path', to: 'root#index'
  root 'root#index'
end
