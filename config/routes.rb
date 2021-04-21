Rails.application.routes.draw do
# 会員側
  get 'homes/top'
  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations'
      }

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'customers/quit' => 'customers#quit'
  get 'orders/complete' => 'orders#complete'
  resources :items
  resources :cart_items
  resources :orders
  resources :shipping_addresses
  resources :customers
  get 'search/search'
  get '/search', to: 'search#search'

# 管理側
  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations'
      }

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :genres
    resources :orders
    resources :order_details, only:[:update]
    resources :items
    resources :customers
  end

end
