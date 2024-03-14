Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :interviews do
    member do
      get "/feedback", to: "interviews#feedback", as: :feedback
      post :next_question
    end
  end
  resources :interview_questions do
    member do
      get "skip_question", to: "answers#skip_question", as: :skip_question
    end
    resources :answers, only: [:create, :show]
  end
  get "/profile", to: "interviews#my_profile", as: :my_profile
  get "/interviews/:id/feedback", to: "interviews#feedback", as: :feedback
  resources :questions, except: [:index, :create, :show, :new, :destroy] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:destroy], as: :bookmark_destroy
  post '/generate_speech', to: 'audio#generate_speech'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
end
