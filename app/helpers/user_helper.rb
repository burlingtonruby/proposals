module UserHelper
  def current_user
    begin
      User.find(session[:user_id])
    rescue
      nil
    end
  end
end
