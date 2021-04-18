Rails.application.routes.draw do

  get 'homes/top'
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :cart_items
  resources :orders
  resources :shipping_addresses

  devise_for :admins
  namespace :admin do
    #get 'homes/top' => 'admin/homes#top'
    resources :genres
    resources :order_details, only:[:update]

  end

end
