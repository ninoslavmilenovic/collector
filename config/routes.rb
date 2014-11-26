Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Core::API => '/api'

  root to: 'admin/dashboard#index'
end
