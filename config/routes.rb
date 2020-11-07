Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  constraints do
    scope module: 'api' do
      namespace :secure do
        namespace :v1 do
          resources :posts, only: [] do
            collection do
              get 'list', to: 'posts#list'
            end
          end
        end
      end
      namespace :public do
        namespace :v1 do
          resources :posts, only: [] do
            collection do
              get 'list', to: 'posts#list'
            end
          end
        end
      end
    end
  end

end
