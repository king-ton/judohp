class AgeClassesController < ApplicationController
  before_action :set_age_class, only: [:show, :edit, :update, :destroy]
  before_action { authorize(AgeClass.new) }

  # GET /age_classes
  # GET /age_classes.json
  def index
    @age_classes = AgeClass.all
  end

  # GET /age_classes/1
  # GET /age_classes/1.json
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
  # POST /age_classes.json
  def create
    @age_class = AgeClass.new(age_class_params)

    respond_to do |format|
      if @age_class.save
        format.html { redirect_to @age_class, notice: 'Age class was successfully created.' }
        format.json { render :show, status: :created, location: @age_class }
      else
        format.html { render :new }
        format.json { render json: @age_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /age_classes/1
  # PATCH/PUT /age_classes/1.json
  def update
    respond_to do |format|
      if @age_class.update(age_class_params)
        format.html { redirect_to @age_class, notice: 'Age class was successfully updated.' }
        format.json { render :show, status: :ok, location: @age_class }
      else
        format.html { render :edit }
        format.json { render json: @age_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_classes/1
  # DELETE /age_classes/1.json
  def destroy
    @age_class.destroy
    respond_to do |format|
      format.html { redirect_to age_classes_url, notice: 'Age class was successfully destroyed.' }
      format.json { head :no_content }
    end
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
