Rails.application.routes.draw do
  devise_for :users
  
  resources :properties

  root to: 'pages#home'
  
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
