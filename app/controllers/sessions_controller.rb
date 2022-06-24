class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:referer].present? ? (redirect_to session[:referer]) : (redirect_to root_path)
      session.delete(:referer)
    else
      flash.now[:alert] = t('flash.message.login')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
