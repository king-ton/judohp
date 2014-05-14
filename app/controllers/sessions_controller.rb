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
      redirect_back_or user
    else
      flash.now[:danger] = t('views.session.msg.create_error')
      render action: 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = t('views.session.msg.sign_out')
    redirect_to root_path
  end
end
