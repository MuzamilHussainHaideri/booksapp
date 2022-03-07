Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { registration: 'registrations' }
  resources :users
  resources :books do
    resources :reviews
    end
  namespace :api do
    namespace :v1 do
      resources :books do
        resources :reviews
      end
    end
  end


  root 'books#index'

end
