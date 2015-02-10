Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users' }

  devise_scope :user do
    resource :profile, only: [:show, :edit, :update], controller: "profile"
  end

  root to: 'home#index'

  resources :communities do
    resources :discussions
    resources :supplements
  end

  resources :memberships
  resources :posts
end
