VetClinic::Application.routes.draw do
  resources :pets

  devise_for :users
  # root 'welcome#index'

end
