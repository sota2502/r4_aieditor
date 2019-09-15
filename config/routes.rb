Rails.application.routes.draw do
  resources :ai_routines do
    resources :hp_conditions, only: [:index, :show] do

    end
  end
  resources :action_groups do
    resources :action_rules do
      resources :cancel_conditions
    end
  end
  resources :search_ranges
  resources :probabilities
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
