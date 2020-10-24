Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root "items#index"
  resources :items, except: [:index] do
    resources :item_purchases, only: [:index, :new, :create]
    resources :comments, only: [:create]
    collection do
      get 'tag_search'
      get 'item_search'
    end
  end
end
