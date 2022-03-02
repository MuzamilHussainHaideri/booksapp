Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :books do
    resources :reviews
  end

  root 'books#index'

end
