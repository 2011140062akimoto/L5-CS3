class SessionsController < ApplicationController
  def main
    if session[:login_uid]
      redirect_to '/tweets'
    else
      render 'login'
    end
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to root_path
    else
      render 'error'
    end
  end
  
  def signin
    user = User.new(uid: params[:uid], pass: BCrypt::Password.create(params[:pass]))
    if user.save
      session[:login_uid] = params[:uid] 
      redirect_to root_path
    else
      render 'error'
    end
  end
  
  def signin_view
    render 'signin'
  end
  
  def logout
    session.delete(:login_uid)     
    redirect_to root_path
  end
end
