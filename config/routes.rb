Rails.application.routes.draw do
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin, ActiveAdmin::Devise.config.merge(:path => :admin)
  devise_for :doctor, ActiveAdmin::Devise.config.merge(:path => :doctor)
  devise_for :patient, ActiveAdmin::Devise.config.merge(:path => :patient)
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
