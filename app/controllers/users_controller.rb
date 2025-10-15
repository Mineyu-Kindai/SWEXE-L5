class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid])
    @user.pass = BCrypt::Password.create(params[:user][:pass])
    if User.find_by(uid: params[:user][:uid]) != nil
      flash[:notice] = "※ほかのユーザーとUIDが重複しています"
      redirect_to new_user_path
    else 
      @user.save
      redirect_to top_main_path
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

end
