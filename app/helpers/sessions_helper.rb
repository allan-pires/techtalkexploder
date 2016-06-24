module SessionsHelper
  def current_user
    User.where(id: session[:user_id]).last if session?
  end

  def session?
    session[:user_id]
  end
end
