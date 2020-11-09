Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    root to: 'pages#home'
    controller :pages do
      get :home
    end
  end
end
