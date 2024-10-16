Rails.application.routes.draw do
  get "questions/index"
  get "questions/show"
  get "questions/new"
  get "questions/edit"
  get "questions/destroy"
  get "quizzes/index"
  get "quizzes/show"
  get "quizzes/new"
  get "quizzes/edit"
  get "quizzes/destroy"
  get "enrollments/index"
  get "enrollments/show"
  get "enrollments/new"
  get "enrollments/edit"
  get "enrollments/destroy"
  get "lessons/index"
  get "lessons/show"
  get "lessons/new"
  get "lessons/edit"
  get "lessons/destroy"
  get "courses/index"
  get "courses/show"
  get "courses/new"
  get "courses/edit"
  get "courses/destroy"
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/edit"
  get "categories/destroy"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/edit"
  get "users/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
