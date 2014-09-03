class AgeClassesController < ApplicationController
  before_action :set_age_class, only: [:show, :edit, :update, :destroy, :delete]
  before_action { authorize(AgeClass.new) }

  # GET /age_classes
  def index
    @age_classes = AgeClass.all
  end

  # GET /age_classes/1
  def show
  end

  # GET /age_classes/new
  def new
    @age_class = AgeClass.new
  end

  # GET /age_classes/1/edit
  def edit
  end

  # POST /age_classes
  def create
    @age_class = AgeClass.new(age_class_params)

    if @age_class.save
      flash[:success] = t('.msg')
      redirect_to @age_class
    else
      render :new
    end
  end

  # PATCH/PUT /age_classes/1
  def update
    if @age_class.update(age_class_params)
      flash[:success] = t('.msg')
      redirect_to @age_class
    else
      render :edit
    end
  end

  def delete
  end

  # DELETE /age_classes/1
  def destroy
    @age_class.destroy
    redirect_to age_classes_url, notice: 'Age class was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_age_class
    @age_class = AgeClass.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def age_class_params
    params.require(:age_class).permit(:name, :min_age, :max_age)
  end
end
