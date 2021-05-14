Rails.application.routes.draw do
  get 'items/index'
  get 'items/search'
  devise_for :users
  root to: "items#index"
  
  resources :items do
    collection do
    get 'items/search' => 'items#search'
   end
    resources :orders, only: [:index, :create]
  end

  root 'comment#new'
  resources :comments, only: [:create]
  # resources :tweets do
  #   resources :comments, only: :create
  # end ネストの記述要見直し
end