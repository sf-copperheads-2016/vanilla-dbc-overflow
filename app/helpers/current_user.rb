helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorized?
    current_user.id == params[:id].to_i
  end

end
