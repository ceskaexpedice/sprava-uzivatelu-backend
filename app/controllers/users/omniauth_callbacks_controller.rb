class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def redirect_callbacks
    puts(request.env['omniauth.auth'])
    redirect_to "http://localhost:4200"
  end


end