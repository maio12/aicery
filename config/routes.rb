Rails.application.routes.draw do
  get 'pages/profile'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: [:edit, :show, :index, :update] do
    get '/checkout', to: 'checkout#index'
    get '/checkout/supermarket/:supermarket_id', to: 'supermarket#show'
  end


  resources :items, only: :update do
    patch :plus
    patch :minus
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
