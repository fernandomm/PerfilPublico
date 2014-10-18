Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'main#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  get 'candidates/:id', to: 'candidates#show', as: :candidate

  get 'candidates/:id/promises/:promise_id', to: 'promises#show', as: :promise

end
