class SessionsController < ApplicationController
  def new
    if signed_in?
      #redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to profile_path
    else
      flash.now[:danger] = t('sessions.msg.create_error')
      render action: 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = t('.msg')
    redirect_to root_path
  end
end
