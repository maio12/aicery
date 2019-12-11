Rails.application.routes.draw do
  get 'pages/profile'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: [:edit, :show, :index] do
    patch 'items/:id/plus', to: 'items#update_plus', as: 'item_plus'
    patch 'items/:id/minus', to: 'items#update_minus', as: 'item_minus'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
