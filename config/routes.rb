Rails.application.routes.draw do
  root 'products#index'

  post '/cart/add/:id' => 'products#a_cart', as: :cart_add

  scope 'sec' do
    devise_for :users, only: :sessions
    namespace :admin do
      root 'products#index'
      resources :products
      resources :categories
    end
  end
end
