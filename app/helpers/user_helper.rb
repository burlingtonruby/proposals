module UserHelper
  def current_user
    begin
      User.find(session[:user_id])
    rescue
      nil
    end
  end

  def require_authentication!
    if current_user.blank?
      redirect_to root_path
      flash[:alert] = "You must sign in to do that."
      return
    end
  end

  def require_permission!(user)
    unless current_user && current_user == user
      redirect_to root_path
      flash[:alert] = "You do not have access to that."
    end
  end
end
