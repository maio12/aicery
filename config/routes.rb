Rails.application.routes.draw do
  get 'items/create'
  get 'pages/profile'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: [:edit, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
