class UsersController < ApplicationController
  before_filter :require_authentication!

  def show
    @user = User.find(params[:id])
    require_permission!(@user)
  end

  def edit
    @user = User.find(params[:id])
    require_permission!(@user)
  end

  def update
    @user = User.find(params[:id])
    unless require_permission!(@user)
      if @user.update_attributes(user_params)
        redirect_to @user
        flash[:success] = 'Profile successfully updated.'
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :website, :twitter, :github)
  end
end
