class ProfileController < ApplicationController
  before_action :user_signed_in
  
  def index
    @user = current_user
    @members = @user.active_members
  end
  
  def password
    @user = current_user
    
    if request.post?
      @user.password, @user.password_confirmation = params[:user][:new_password], params[:user][:new_password_confirmation]
      if @user.save
        flash[:success] = t(:notice_user_password_updated)
        redirect_to profile_path
      end
    end
  end
  
  def member
    @member = Member.find_by_member_number(params[:member_number])
    if @member.user != current_user
      flash[:danger] = t(:error_member_not_found)
      redirect_to profile_path
    end
  end
  
  private
  
  def user_signed_in
    if current_user == nil
      flash[:info] = t(:notice_sign_in)
      redirect_to signin_path
    end
  end
  
end