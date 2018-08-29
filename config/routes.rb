Rails.application.routes.draw do

  root 'static_pages#home'
  get '/profil', to: 'static_pages#profil'
  
  get '/carts/new', to: 'carts#new'
  
  get '/carts/show', to: 'carts#show'
  get '/carts/edit/:id_item_to_del', to: 'carts#edit'


  get 'item/:id_item_detail', to: 'items#show'
  get 'item/add/:id_item_to_add', to: 'items#add'

  devise_for :users
end
