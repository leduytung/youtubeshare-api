Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'api/devise/v1/users/sessions',
    registrations: 'api/devise/v1/users/registrations'
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
