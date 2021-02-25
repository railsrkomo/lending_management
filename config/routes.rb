Rails.application.routes.draw do
  root "authentications#new"
  resource :authentication, only: [:new, :create, :destroy]
  resources :fellows
  resources :lendings
  resources :users, except: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
