class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :delete]
  before_action except: [:show, :edit, :update, :activate] do
    authorize(User.new)
  end
  before_filter :correct_user, only: [:edit, :update]
  before_filter :skip_password_attribute, only: :update
  #after_action :verify_authorized

  # GET /users
  def index
    #authorize(User.new)
    @users = User.all #policy_scope(User)
  end

  # GET /users/1
  def show
    authorize(@user) if !current_user?(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      #sign_in @user
      flash[:success] = t('.msg')
      redirect_to @user
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      sign_in @user
      flash[:success] = t('.msg')
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  def delete
  end

  # DELETE /roles/1
  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
  end
  
  def activate
    @user = User.find_by_activation_token(params[:activation_token])
    if @user
      @user.activated = true
       if @user.save
         flash[:success] = t("user.activate.success")
         puts "###########################"
       else
         flash[:danger] = "Ein Fehler ist aufgetreten."
       end
      
    else
      flash[:danger] = t("user.activate.error")
    end
    redirect_to root_path
  end

  # DELETE /users/1
  #def destroy
   # if @user.destroy
    #  flash[:success] = t('views.user.msg.destroyed')
   # end
    #redirect_to users_url
  #end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, { :role_ids => [] })
  end

  def correct_user
    if !(policy(User.new).self? && current_user?(@user))
      authorize(User.new)
    end
  end
  
  def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except!(:password, :password_confirmation)
    end
  end
end
