Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  root to: 'welcome#index'

  namespace :api, defaults: {format: :json} do
    get 'credentials', to: 'credentials#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
