Rails.application.routes.draw do
  root 'static_pages#home'
  resources :items, only:[:index, :show]
  devise_for :users
  get 'items/show'
end
