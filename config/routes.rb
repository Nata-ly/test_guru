Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, expect: :index do
      resources :answers, shallow: true, expect: :index
    end
  end
end
