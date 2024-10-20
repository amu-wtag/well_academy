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


  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
