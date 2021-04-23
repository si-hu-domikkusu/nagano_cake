Rails.application.routes.draw do
# 会員側
  get 'homes/top'
  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations'
      }

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'orders/complete' => 'orders#complete'
  resources :items
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items
  resources :shipping_addresses
  resources :customers
  # 退会確認画面
  get '/customer/:id/quit' => 'customers#quit', as: 'quit'
  # 論理削除用のルーティング
  patch '/customer/:id/withdraw' => 'customers#withdraw', as: 'withdraw'

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
