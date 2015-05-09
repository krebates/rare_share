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

  resources :user_attachments

  resources :discussions, only: [:show, :create]

  resources :leader_requests, only: [:create]

  resources :conversations do
    resources :replies, only: [:new, :create], module: :conversation
  end

  resources :memberships, only: [:create, :destroy]
  resources :posts, only: [:create]
end
