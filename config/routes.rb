Rails.application.routes.draw do

  root 'static_pages#home'
  
  get '/carts/new', to: 'carts#new'
  
  get '/carts/edit/:id_item_to_del', to: 'carts#edit'
  get '/carts/show/', to: 'carts#show'

  get '/item/:id_item_detail', to: 'items#show'
  get 'item/add/:id_item_to_add', to: 'items#add'

  devise_for :users
end
