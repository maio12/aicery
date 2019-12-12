Rails.application.routes.draw do
  get 'pages/profile'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: [:edit, :show, :index] do
    get '/checkout', to: 'checkout#index'
    get '/checkout/supermarket/:supermarket_id', to: 'supermarket#show'
  end

  resources :items, only: [:update, :create] do
    patch :plus
    patch :minus
  end
end
