class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]
  before_action { authorize(Competition.new) }
  before_action :set_age_classes, only: [:new, :edit]

  # GET /competitions
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      flash[:success] = t('.msg')
      redirect_to @competition
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /competitions/1
  def update
    if @competition.update(competition_params)
      flash[:success] = t('.msg')
      redirect_to @competition
    else
      render :edit
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: t('.msg') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_competition
    @competition = Competition.find(params[:id])
  end
  
  def set_age_classes
    @age_classes = AgeClass.all.order("min_age, max_age, name")
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def competition_params
    params.require(:competition).permit(:title, :start_date, :end_date, :venue_id, :competition_template_id, { :age_class_ids => [] })
  end
end
