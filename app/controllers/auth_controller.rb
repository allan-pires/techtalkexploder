class AuthController < ApplicationController

  def callback
    token = request.env['omniauth.auth']["credentials"]["token"]
    email = request.env['omniauth.auth']["info"]["email"]

    user = User.find_or_create_by(email: email)

    if user
      user.password = SecureRandom.hex # setting some password for this user avoiding security flaws

      GoogleOauthCredential.create(user: user, token: token)

      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def failure

  end
end
