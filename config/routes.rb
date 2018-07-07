Rails.application.routes.draw do
  get 'searchs/index'
  get 'search/index'
  get 'search/show'
  root 'home#index'
  resources :promotions
  resource :cart do
    collection do
      post 'update_cart'
      post 'destroy_cart'
      post 'nil'
    end
  end
  resources :order_items
  resources :orders
  resources :order_statuses
  resources :customers
  resources :products
  resources :types
  devise_for :users
  resources :users
  get '/cart/checkout' =>'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
