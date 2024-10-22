Rails.application.routes.draw do
  root "home#index"
  get "home/index"
  resources :categories
  resources :courses
  resources :users
  resources :lessons
  resources :enrollments
  resources :quizzes
  resources :questions
  resources :options
  resources :quiz_participations
  resources :reviews
  resources :payments

  get "users/login", to: "users#login"
  post "users/create", to: "users#create"

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "sessions/login"
  get "sessions/logout", to: "sessions#destroy"
  get "sessions/attempt_logout"
  post "sessions/attempt_login"
  get "users/create", to: "users#create"
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
