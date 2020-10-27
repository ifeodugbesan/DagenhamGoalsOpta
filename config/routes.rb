Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'opta_poplar', to: 'pages#stats'
  get 'players', to: 'pages#players'
  resources :matches do
    resources :match_goals, only: [:new, :create, :edit, :update]
    resources :teams, only: [:new, :create, :edit, :update]
    member do
      get 'result_confirmation'
    end
  end
  resources :match_goals, only: [:destroy]
  resources :teams, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
