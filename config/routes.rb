Rails.application.routes.draw do

  resources :charges

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get '/profil', to: 'static_pages#profil'

  resources :carts, except: [:destroy] do
    get 'pay/:money', action: 'pay', as: 'payment'
    get 'item/:item_id', action: 'edit', as: 'edit'
  end

  # get '/carts/edit/:id_item_to_del', to: 'carts#edit'

  resources :items, only: [:new, :create] do
    get 'show', action: 'show', as: 'show'
    get 'add/', action: 'add', as: 'add'
  end

  devise_for :users
end
