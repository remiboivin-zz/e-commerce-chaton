Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/carts/new', to: 'carts#new'
  
  get '/carts/show', to: 'carts#show'
  get '/carts/edit/:id_item_to_del', to: 'carts#edit'

  devise_for :users
end
