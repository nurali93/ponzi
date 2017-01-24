Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
