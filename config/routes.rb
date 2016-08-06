Rails.application.routes.draw do
  get 'app/index'

  root to: "app#index"
  devise_for :users, controllers: {registrations: 'users/registrations'}
  
end
