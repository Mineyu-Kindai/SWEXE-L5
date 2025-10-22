class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    u = User.new(uid: params[:user][:uid],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
    if User.find_by(uid: params[:user][:uid]) != nil
      flash[:notice] = "※ほかのユーザーとUIDが重複しています"
      redirect_to new_user_path
    else
      np = Profile.new(message: "")
      np.save
      u.profile = np
      u.save
      redirect_to top_main_path
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

end
