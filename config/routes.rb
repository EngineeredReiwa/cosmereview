Rails.application.routes.draw do
  #Reviews画面
  root to: 'reviews#index'
  resources :reviews
  
  #Login/Logout画面
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #Signin画面
  get 'signup', to: 'users#new'
  
end