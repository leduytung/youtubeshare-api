Rails.application.routes.draw do
  devise_for :users, path: 'public/v1/auth', controllers: { 
    sessions: "api/public/v1/sessions",
    registrations: "api/public/v1/registrations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  constraints do
    scope module: 'api' do
      namespace :secure do
        namespace :v1 do
          resources :movies, only: [] do
            collection do
              get '/', to: 'movies#index'
              post '/', to: 'movies#create'
            end
          end

          resources :users, only: [] do
            collection do
              get 'verify_token', to: 'users#verify_token'
            end
          end

          resources :reactions, only: [] do
            collection do
              post '/', to: 'reactions#react'
              post '/list', to: 'reactions#get_reactions'
            end
          end
        end
      end
      namespace :public do
        namespace :v1 do
          resources :movies, only: [] do
            collection do
              get '/', to: 'movies#index'
            end
          end
          resources :users, only: [] do
            collection do
              post '/emails', to: 'users#emails'
            end
          end
        end
      end
    end
  end

end
