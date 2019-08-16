Rails.application.routes.draw do

  namespace :api  do
    namespace :v1  do
      resources :favourites, only: [:index, :create] do
        collection do
          post 'revoke'
        end
      end
    end
  end

  # mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }

  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  
end
