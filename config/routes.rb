Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    root to: 'pages#home'

    controller :pages do
      get :home
      get :test_private
    end

    resources :brands, only: %i[index show new create edit update]
    resources :categories, only: %i[index new create edit update]
    resources :sizes, only: %i[index new create edit update]
    resources :products, only: %i[index show new create edit update] do
      resources :stocks, only: %i[new create edit update]
    end
  end
end
