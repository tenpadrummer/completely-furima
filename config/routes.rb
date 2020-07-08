Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :item, only: [:new, :create]
end
