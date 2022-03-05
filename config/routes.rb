Rails.application.routes.draw do

  devise_for :users
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
