class CompetitionTemplatesController < ApplicationController
  before_action :set_competition_template, only: [:show, :edit, :update, :destroy]
  before_action { authorize(CompetitionTemplate.new) }

  # GET /competition_templates
  # GET /competition_templates.json
  def index
    @competition_templates = CompetitionTemplate.all
  end

  # GET /competition_templates/1
  # GET /competition_templates/1.json
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
  # POST /competition_templates.json
  def create
    @competition_template = CompetitionTemplate.new(competition_template_params)

    respond_to do |format|
      if @competition_template.save
        format.html { redirect_to @competition_template, notice: 'Competition template was successfully created.' }
        format.json { render :show, status: :created, location: @competition_template }
      else
        format.html { render :new }
        format.json { render json: @competition_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competition_templates/1
  # PATCH/PUT /competition_templates/1.json
  def update
    respond_to do |format|
      if @competition_template.update(competition_template_params)
        format.html { redirect_to @competition_template, notice: 'Competition template was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition_template }
      else
        format.html { render :edit }
        format.json { render json: @competition_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competition_templates/1
  # DELETE /competition_templates/1.json
  def destroy
    @competition_template.destroy
    respond_to do |format|
      format.html { redirect_to competition_templates_url, notice: 'Competition template was successfully destroyed.' }
      format.json { head :no_content }
    end
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
