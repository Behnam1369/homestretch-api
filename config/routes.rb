# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get 'users/profile', to: 'users#show_profile'
  post 'users/profile', to: 'users#save_profile'
  post 'users/avatar', to: 'users#upload_avatar'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
