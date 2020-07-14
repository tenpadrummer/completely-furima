Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:show, :new, :create] do
    resources :item_purchases, only: [:index, :new, :create]
  end
end
