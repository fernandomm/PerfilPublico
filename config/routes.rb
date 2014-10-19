Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'main#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  get '/state/:state' => 'states#show', as: :state


  resources :candidates, :only => [:show, :index] do
    resources :promises, :only => [:show, :new, :create] do
      member do
        get :vote_up
        get :vote_down
      end
    end
  end
end
