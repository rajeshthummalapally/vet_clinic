VetClinic::Application.routes.draw do
  resources :appointments
  
  resources :pets

  devise_for :users
  namespace :admin do
    resources :users
  end

  root 'appointments#index'
end
