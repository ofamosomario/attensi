Rails.application.routes.draw do

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
          get :'/top-users/:week_number',  to: 'users#top_users'
          get :'/topper-and-lower-users',  to: 'users#topper_and_lower_users'

          resources :scores          

        end
      
      end

    end

  end

end