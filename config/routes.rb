Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { registrations: 'users/registrations' }

  resource :contacts, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :progresses, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, expect: :index do
        resources :answers, shallow: true, expect: :index
      end
    end
  end
end
