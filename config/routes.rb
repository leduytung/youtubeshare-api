Rails.application.routes.draw do
  devise_for :users, path: 'public/api/v1/auth', controllers: { 
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
        end
      end
    end
  end

end
