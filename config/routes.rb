Rails.application.routes.draw do
  get 'lists/show'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
