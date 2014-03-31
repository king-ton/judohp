class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action { authorize(Person.new) }

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    respond_to do |format|
      format.js do
        @people = Person.all
        @person = Person.create(person_params)
      end
      format.html do
        @person = Person.new(person_params)

        if @person.save
          flash[:success] = t('views.person.msg.created')
          redirect_to @person
        else
          render action: 'new'
        end
      end
    end
  end

  # PATCH/PUT /people/1
  def update

    respond_to do |format|
      format.js do
        @people = Person.all
        @person = Person.find(params[:id])
        @person.update_attributes(person_params)
      end

      format.html do
        if @person.update(person_params)
          flash[:success] = t('views.person.msg.updated')
          redirect_to @person
        else
          render action: 'edit'
        end
      end
    end
  end

  def delete
    @person = Person.find(params[:person_id])
  end

  # DELETE /people/1
  def destroy
    @people = Person.all
    @person = Person.find(params[:id])
    @person.destroy
  #redirect_to people_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:last_name, :first_name, :gender, :birth_date, :birth_place, :street, :zip, :city, :user_id)
  end
end
