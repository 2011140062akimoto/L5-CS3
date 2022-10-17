class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(params[:uid])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user_log_in @user
      flash[:success] = '登録が完了しました'
      redirect_to root
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:uid])
  end

  def update
    @user = Client.find_by(params[:uid])
    if @user.update(user_params)
      flash[:success] = '更新が完了しました'
      redirect_to root
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find_by(params[:uid])
    if @user.destroy
      redirect_to root
    else
      redirect_to root
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :password)
  end
end
