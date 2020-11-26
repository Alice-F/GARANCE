Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    root to: 'pages#home'

    controller :pages do
      get :home
    end

    resources :brands, only: %i[index show new create edit update]
    resources :categories, only: %i[new create index edit update]
    resources :sizes, only: %i[new create index edit update]
    resources :products, only: %i[new create index edit update]
    resources :stocks, only: %i[new create index edit update]
  end
end
