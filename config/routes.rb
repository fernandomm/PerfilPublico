Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'main#index'
  devise_for :users

  get 'candidates/:id', to: 'candidates#show', as: :candidate
end
