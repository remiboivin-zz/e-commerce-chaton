Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/edit'
  get 'carts/new'
  get 'carts/show'
  root 'static_pages#home'

  devise_for :users
end
