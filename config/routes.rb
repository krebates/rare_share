Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users' }
  root to: 'home#index'
end
