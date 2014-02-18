VetClinic::Application.routes.draw do
  resources :appointments

  resources :pets

  devise_for :users
  # root 'welcome#index'

end
