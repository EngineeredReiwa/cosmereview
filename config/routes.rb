Rails.application.routes.draw do
  #Reviews画面
  root to: 'reviews#index'
  resources :reviews, only: [:index, :show, :new, :create, :destroy]
  
  #Login/Logout画面
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #Signin画面
  get 'signup', to: 'users#new'
  
  #Users画面
  resources :users, only: [:index, :show, :create]
  
end