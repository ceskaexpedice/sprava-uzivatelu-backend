Rails.application.routes.draw do

  namespace :api  do
    namespace :v1  do
      resources :favourites, only: [:index, :create] do
        collection do
          post 'revoke'
        end
      end
      resources :last_page_indices, only: [:index, :create]
    end
  end

  # mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }

  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  

  namespace :api  do
    namespace :admin  do
      resources :users, only: [:index] do
        member do
          post 'add_role'
          post 'remove_role'
        end
      end
    end
  end


end
