Rails.application.routes.draw do
  resources :projects do
    resources :action_states do
      resources :targets
      resources :rates, except: [:show, :new, :edit]
      resources :searches, except: [:show, :new, :edit]
    end

    resources :cancel_conditions

    resources :action_chains do
      resources :action_rules
    end

    resources :exactions do
      resources :hp_conditions do
        resources :actions
      end
    end
  end

  root to: 'projects#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
