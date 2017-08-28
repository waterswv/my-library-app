module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
  def require_login
    if current_user.nil?
      flash[:notice] = "Please login first."      # <--- Add this flash notice
      redirect_to "/login"
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logout
    @current_user = session[:user_id] = nil
  end
end
