Rails.application.routes.draw do
  root 'products#index'
  scope 'sec' do
    devise_for :users, only: :sessions
    namespace :admin do
      root 'products#index'
      resources :products
      resources :categories
    end
  end
end
