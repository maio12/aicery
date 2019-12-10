Rails.application.routes.draw do
  get 'pages/profile'

  devise_for :users
  root to: 'pages#home'

  resources :lists, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :lists, only: [:index, :show]
end
