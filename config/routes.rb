Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/carts/index', to: 'carts#index'
  get '/carts/edit', to: 'carts#edit'
  get '/carts/new', to: 'carts#new'
  
  get '/carts/show', to: 'carts#show'

  devise_for :users
end
