Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
