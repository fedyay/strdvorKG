Rails.application.routes.draw do
  root 'products#index'

  post '/cart/add/:id' => 'products#a_cart', as: :cart_add
  post '/cart/remove/:id' => 'products#rem1_cart', as: :cart_rem1
  post '/cart/clear' => 'products#clear_cart', as: :cart_clear

  patch '/fill' => 'products#fill', as: :fill
  post '/subb' => 'products#subb', as: :subb

  scope 'sec' do
    devise_for :users, only: :sessions
    namespace :admin do
      root 'products#index'
      resources :products
      resources :categories
    end
  end
end
