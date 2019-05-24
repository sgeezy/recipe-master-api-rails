# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :favorite_recipes
      post 'refresh', controller: :refresh, action: :create
      post 'signin', controller: :signin, action: :create
      post 'signup', controller: :signup, action: :create
      delete 'signin', controller: :signin, action: :destroy
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
