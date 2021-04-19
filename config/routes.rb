Rails.application.routes.draw do
# 会員側
  get 'homes/top'
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :cart_items
  resources :orders
  resources :shipping_addresses
  resources :customers

# 管理側
  devise_for :admins #adminに変更の可能性あり
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :genres
    resources :orders
    resources :order_details, only:[:update]
    resources :items
    resources :custamers


  end

end
