class AuthController < ApplicationController

  def callback
    token = request.env['omniauth.auth']["credentials"]["token"]
    email = request.env['omniauth.auth']["info"]["email"]
    image = request.env['omniauth.auth']["info"]["image"]

    user = User.find_or_create_by(email: email)

    if user
      user.password = SecureRandom.hex # setting some password for this user avoiding security flaws

      GoogleOauthCredential.create(user: user, token: token, image: image)

      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def failure

  end
end
