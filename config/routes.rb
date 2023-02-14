# frozen_string_literal: true

Rails.application.routes.draw do
  get 'contents/education', to: 'contents#education'
  get 'contents/resource', to: 'contents#resource'
  get 'contents/:content_type', to: 'contents#specific_content'

  resources :contents, except: %i[new index]

  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get 'users/profile', to: 'users#show_profile'
  post 'users/profile', to: 'users#save_profile'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
