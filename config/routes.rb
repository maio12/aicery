Rails.application.routes.draw do
  get 'pages/profile'
  devise_for :users

  root to: 'pages#home'
  resources :lists, only: [:edit, :show, :index, :update, :destroy] do

    resource :checkout, only: :show
    resources :supermarkets, only: :show,
                             controller: :shoppings
    # get '/checkout/supermarket/:supermarket_id', to: 'checkouts#purchase', as: :purchases
  end

  resources :items, only: [:update, :create, :destroy] do
    patch :plus
    patch :minus
  end

  resource :search, only: :show
end
