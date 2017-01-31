Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'welcome#index'

  get 'r/:code', to: 'offers#recruit', as: :offer_recruit
  resources :offers
  resources :payables do
    resources :payments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
