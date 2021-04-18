Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
end
