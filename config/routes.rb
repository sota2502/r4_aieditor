Rails.application.routes.draw do
  resources :action_groups do
    resources :action_rules
  end
  resources :search_ranges
  resources :probabilities
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
