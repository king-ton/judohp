class MembersController < ApplicationController
  before_action :set_member,  only: [:show, :edit, :update, :destroy]
  before_action :set_members, only: [:index, :destroy]
  before_action { authorize(Member.new) }

  # GET /members
  def index
  end

  # GET /members/1
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @member.build_person
    @member.build_user
    @people = Person.joins("LEFT JOIN members ON members.person_id = people.id WHERE members.person_id IS NULL#{@member && @member.person_id ?  ' OR members.person_id = ' + @member.person_id.to_s : ''}")
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    user = User.find_or_initialize_by(email: @member.user.email)

    if user.new_record? && @member.person.birth_date
      user.password = l @member.person.birth_date
      user.password_confirmation = l @member.person.birth_date
      user.person = @member.person
    end
    @member.user = user
    if @member.save
      MemberMailer.new_member(@member).deliver
      flash[:success] = t('.msg')
      redirect_to @member
    else
      @member.person.errors.add_on_blank(:birth_date) if user.new_record? && !@member.person.birth_date && @member.user.email != ''
      @member.user.id = ''
      if User.find_by_email(@member.user.email)
        @member.user.errors.delete(:email)
      end
      render action: 'new'
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      flash[:success] = t('.msg')
      redirect_to @member
    else
      render action: 'edit'
    end
  end

  def delete
    @member = Member.find(params[:member_id])
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end
  def set_members
    @members = Member.all().order(:member_number)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.require(:member).permit(:member_number, :entry, :exit, :entry_federation, :exit_federation, :person_id, :dad_id, :mum_id, :user_id, :person_attributes => [:id, :last_name, :first_name, :gender, :birth_date, :birth_place, :nationality, :street, :zip, :city, :contacts_attributes => [:id, :name, :number, :_destroy]], :user_attributes => [:id, :email, :person])
  end
end
