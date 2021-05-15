# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # DEVISE
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      # USERS
      resources :users do
        collection do
          # SCORE
          get '/top-users/:week_number', to: 'users#top_users'
          get '/best-worst-rated-user', to: 'users#best_worst_rated_user'
          resources :scores
        end
      end
    end
  end
end
