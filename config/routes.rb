Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :interviews
  resources :interview_questions do
    resources :answers, only: [:create]
  end
end
