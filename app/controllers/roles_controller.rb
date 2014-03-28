class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :set_act, only: [:show, :edit, :update]
  before_action :set_acts, only: [:new, :create, :edit, :update]
  before_action { authorize(Role.new) }

  # GET /roles
  def index
    @roles = Role.all #policy_scope(User)
  end

  # GET /roles/1
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = t('views.role.msg.created')
      redirect_to @role
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      flash[:success] = t('views.role.msg.updated')
      redirect_to @role
    else
      render action: 'edit'
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  def set_act
    @act = @role.activities.group_by { |act| act[/([a-z]+)\:[a-z]+/, 1] }
  end

  def set_acts
    @acts = ["user:index",    "user:show",    "user:new",   "user:edit",    "user:delete",
             "role:index",    "role:show",    "role:new",   "role:edit",    "role:delete",
             "person:index",  "person:show",  "person:new", "person:edit",  "person:delete"]
             .group_by { |act| act[/([a-z]+)\:[a-z]+/, 1] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :activities => [])
  end

end