Rails.application.routes.draw do
  root 'exams#index'

  resources :exams, only: %i[index new edit create update destroy]
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]

  get 'user/login' => 'users#login', :as => :login_user
  post 'user/auth' => 'users#auth', :as => :auth_user
end
