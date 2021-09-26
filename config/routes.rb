Rails.application.routes.draw do

  root to: 'toppages#index'
  get 'reviews', to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  #Users画面
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end

  #画面なし
  resources :reviews, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

end