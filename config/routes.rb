Rails.application.routes.draw do

  devise_for :users

  resource :books
  root 'books#index'

end
