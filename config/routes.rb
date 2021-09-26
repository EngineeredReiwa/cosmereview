Rails.application.routes.draw do
  #Top画面
  root to: 'toppages#index'
  
  #Login/Logout画面
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #Signin画面
  get 'signup', to: 'users#new'
  
  #Users画面
  resources :users, only: [:index, :show, :create] do
    member do
      get :reviews
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