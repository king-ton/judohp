class CompetitionTemplatesController < ApplicationController
  before_action :set_competition_template, only: [:show, :edit, :update, :destroy]
  before_action { authorize(CompetitionTemplate.new) }

  # GET /competition_templates
  def index
    @competition_templates = CompetitionTemplate.all
  end

  # GET /competition_templates/1
  def show
  end

  # GET /competition_templates/new
  def new
    @competition_template = CompetitionTemplate.new
  end

  # GET /competition_templates/1/edit
  def edit
  end

  # POST /competition_templates
  def create
    respond_to do |format|
      format.js do
        @competition_templates = CompetitionTemplate.all
        @competition_template = CompetitionTemplate.create(competition_template_params)
      end
      format.html do
        @competition_template = CompetitionTemplate.new(competition_template_params)

        if @competition_template.save
          flash[:success] = t('.msg')
          redirect_to @competition_template
        else
          render action: 'new'
        end
      end
    end
  end

  # PATCH/PUT /competition_templates/1
  def update
    respond_to do |format|
      format.js do
        @competition_templates = CompetitionTemplate.all
        @competition_template = CompetitionTemplate.find(params[:id])
        @competition_template.update_attributes(competition_template_params)
      end

      format.html do
        if @competition_template.update(competition_template_params)
          flash[:success] = t('.msg')
          redirect_to @competition_template
        else
          render action: 'edit'
        end
      end
    end
  end

  # DELETE /competition_templates/1
  def destroy
    @competition_template.destroy
    redirect_to competition_templates_url, notice: 'Competition template was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_competition_template
    @competition_template = CompetitionTemplate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def competition_template_params
    params.require(:competition_template).permit(:title, :short_name, :venue_id)
  end
end
