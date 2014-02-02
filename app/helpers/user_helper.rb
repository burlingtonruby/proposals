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
      render file: 'public/401.html', status: :unauthorized
    end
  end

  def require_admin!
    if current_user.blank?
      require_authentication!
    elsif !current_user.admin?
      render file: 'public/401.html', status: :unauthorized
    end
  end
end
