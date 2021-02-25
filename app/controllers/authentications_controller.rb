class AuthenticationsController < ApplicationController
  skip_before_action :authentication_check, except: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:authentication][:email].downcase)
    if user && user.authenticate(params[:authentication][:password]) 
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "ログインできました"
    else
      flash[:notice] =  "認証できません"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_authentication_path
  end
end
