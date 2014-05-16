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
    respond_to do |format|
      format.js do
        @roles = Role.all
        @role = Role.create(role_params)
      end

      format.html do
        @role = Role.new(role_params)
        if @role.save
          flash[:success] = t('views.role.msg.created')
          redirect_to @role
        else
          render action: 'new'
        end
      end
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

  def delete
    @role = Role.find(params[:role_id])
  end

  # DELETE /roles/1
  def destroy
    @roles = Role.all
    @role = Role.find(params[:id])
    @role.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  def set_act
    @act = @role.activities.group_by { |act| act[/(([a-z]|[_])+)\:[a-z]+/, 1] }
  end

  def set_acts
    @acts = [ "age_class:index",            "age_class:show",             "age_class:new",            "age_class:edit",             "age_class:delete",
              "competition:index",          "competition:show",           "competition:new",          "competition:edit",           "competition:delete",
              "competition_template:index", "competition_template:show",  "competition_template:new", "competition_template:edit",  "competition_template:delete",
              "user:index",                 "user:show",                  "user:new",                 "user:edit",                  "user:delete",
              "role:index",                 "role:show",                  "role:new",                 "role:edit",                  "role:delete",
              "person:index",               "person:show",                "person:new",               "person:edit",                "person:delete",
              "member:index",               "member:show",                "member:new",               "member:edit",                "member:delete",
              "venue:index",                "venue:show",                 "venue:new",                "venue:edit",                 "venue:delete"]
             .group_by { |act| act[/(([a-z]|[_])+)\:[a-z]+/, 1] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :activities => [])
  end

end