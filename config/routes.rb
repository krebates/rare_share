Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users' }

  devise_scope :users do
    resources :profile, only: [:show, :edit, :update], controller: "profile"
  end

  root to: 'home#index'

  resources :communities do
    resources :supplements
  end

  resources :users_attachments

  resources :discussions, only: [:show, :create]

  resources :connections

  resources :leader_requests, only: [:create]

  resources :conversations do
    resources :replies, only: [:new, :create], module: :conversation
  end

  resources :memberships
  resources :posts
end
