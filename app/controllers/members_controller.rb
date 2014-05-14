class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action { authorize(Member.new) }

  # GET /members
  def index
    @members = Member.all().order(:member_number)
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @person = @member.build_person
    @user = @member.person.build_user
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  def create
    @member = Member.new(member_params)
    
    @member.person.user = User.find_or_initialize_by(email: @member.person.user.email)
    
    if @member.person.user.new_record?
      @member.person.user.name = @member.person.name
      if @member.person.birth_date
        # Geburtsdatum wird als Passwort gesetzt
        @member.person.user.password = l @member.person.birth_date
        @member.person.user.password_confirmation = l @member.person.birth_date
      end
    end
    
      if @member.save
        UserMailer.welcome_email(@member.person.user).deliver
        flash[:success] = t('views.member.msg.created')
        redirect_to @member
      else
        @member.person.errors.add_on_blank(:birth_date)
        @member.person.user.id = ''
        render action: 'new'
      end
  end

  # PATCH/PUT /members/1
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.require(:member).permit(:member_number, :entry, :exit, :entry_federation, :exit_federation, :dad_id, :mum_id, person_attributes: [:id, :last_name, :first_name, :gender, :birth_date, :birth_place, :street, :zip, :city, :contacts_attributes => [:id, :name, :number, :_destroy], :user_attributes => [:id, :email]])
  end
end
