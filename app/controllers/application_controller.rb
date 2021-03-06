class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

  def user_not_authorized
    redirect_to(signin_path)
    flash[:danger] = I18n.t('pundit.error')
  end
end
