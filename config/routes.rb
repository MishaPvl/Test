Rails.application.routes.draw do
  root 'exams#index'

  resources :exams
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create login]

  get 'users/login' => 'users#login', :as => :login_user
  get 'users/logout' => 'users#logout', :as => :logout_user
  post 'users/auth' => 'users#auth', :as => :auth_user
end
