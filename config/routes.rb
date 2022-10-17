Rails.application.routes.draw do
  root 'sessions#main'
  resources :users
  resources :tweets
  resources :likes

  post 'sessions/login'
  post 'sessions/signin'
  get  'sessions/signin_view'
  post 'sessions/logout'
end
