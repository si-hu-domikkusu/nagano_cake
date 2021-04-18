Rails.application.routes.draw do
  get 'customers/show'
  get 'customers/edit'
  get 'items/index'
  get 'items/show'
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
end
