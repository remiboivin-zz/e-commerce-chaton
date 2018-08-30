Rails.application.routes.draw do

  root 'static_pages#home'
  get '/profil', to: 'static_pages#profil'
  
  get '/carts/new', to: 'carts#new'
  
  get '/carts/edit/:id_item_to_del', to: 'carts#edit'
  get '/carts/show/', to: 'carts#show'
  get '/carts/pay/:money', to: 'carts#pay'
  # get '/users/:un_nom_de_variable', to: 'users#méthode', as: 'ton_nom_de_path_trop_cool'

  get '/item/:id_item_detail', to: 'items#show'
  get '/item/add/:id_item_to_add', to: 'items#add'

  devise_for :users
end
