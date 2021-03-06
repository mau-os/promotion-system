Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :promotions do
    member do
      post 'generate_coupons'
      post 'approve'
    end
    get 'search', on: :collection
  end

  resources :coupons, only: [:show] do
    member do
      post 'disable'
      post 'activate'
    end
    get 'search', on: :collection
  end

  resources :product_categories

  namespace :api, constraints: ->(req) { req.format == :json } do
    namespace :v1 do
      resources :coupons, only: [:show], param: :code
      resources :product_categories, only: [:show, :create, :update, :destroy], param: :code
    end
  end
end
