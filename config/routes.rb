Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    get 'users/new_user_info', to: 'users/registrations#new_user_info'
    post 'users/create_user_info', to: 'users/registrations#create_user_info'
  end
  root "items#index"
  resources :items, except: [:index] do
    resources :item_purchases, only: [:index, :new, :create]
    resources :comments, only: [:create]
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get 'tag_search'
      get 'item_search'
      get 'category_search'
    end
  end
  resources :users, only: [:show, :destroy]
  resources :bookmarks, only: [:index]
end
