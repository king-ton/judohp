class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action { authorize(Venue.new) }

  # GET /venues
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  def create
    respond_to do |format|
      format.js do
        @venues = Venue.all
        @venue = Venue.create(venue_params)
      end
      format.html do
        @venue = Venue.new(venue_params)

        if @venue.save
          flash[:success] = t('.msg')
          redirect_to @venue
        else
          render action: 'new'
        end
      end
    end
  end

  # PATCH/PUT /venues/1
  def update
    respond_to do |format|
      format.js do
        @venues = Venue.all
        @venue = Venue.find(params[:id])
        @venue.update_attributes(venue_params)
      end

      format.html do
        if @venue.update(venue_params)
          flash[:success] = t('.msg')
          redirect_to @venue
        else
          render action: 'edit'
        end
      end
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = Venue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def venue_params
    params.require(:venue).permit(:name, :street, :zip, :city)
  end
end
