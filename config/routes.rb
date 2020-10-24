Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, except: [:index] do
    resources :item_purchases, only: [:index, :new, :create]
    collection do
      get 'tag_search'
      get 'item_search'
    end
  end
end
