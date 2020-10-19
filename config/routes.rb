Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :matches do
    resources :match_goals, only: [:new, :create, :edit, :update]
    resources :teams, only: [:new, :create, :edit, :update]
  end
  resources :match_goals, only: [:destroy]
  resources :teams, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
