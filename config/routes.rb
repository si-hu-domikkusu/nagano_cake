Rails.application.routes.draw do
  
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/complete'
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :cart_items
  resources :orders
  
end
