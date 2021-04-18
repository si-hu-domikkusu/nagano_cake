Rails.application.routes.draw do
  
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :cart_items
  resources :orders
  resources :shipping_addresses
  
  namespace :admins do
    resources :genres
    resources :order_details, only:[:update]
  end
  
end
