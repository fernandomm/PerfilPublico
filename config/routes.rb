Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'main#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :candidates, :only => [:show] do
    resources :promises, :only => [:show]
  end
end
