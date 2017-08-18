class ScreeningsController < ApplicationController
  before_action :set_screening, only: [:show, :edit, :update, :destroy]
  require "open-uri"

  # GET /screenings
  # GET /screenings.json
  def index
    # Generate a map for the US
    markers = Screening.all.select([:latitude, :longitude]).map { |e|  "#{e.latitude.round(1)},#{e.longitude.round(1)}" }
    @static_params = ["size=640x440&markers=size:normal"]
    @url_params = (@static_params + markers).join("|")
    File.open('maps/all_screenings.png', 'wb') do |fo|
      fo.write open("http://maps.googleapis.com/maps/api/staticmap?#{@url_params}").read
    end

    # Generate maps for each state
    # states = Screening.pluck(:state).uniq
    # screenings_by_state = Screening.limit(2000).group_by(&:state)
    # screenings_by_state.each do |state_screenings|
      # state = state_screenings.first
      # screening_array = state_screenings.last
      # if screening_array.length >= 40
        # static_params = @static_params
      # else
        # static_params = ["size=640x440&markers=size:normal"]
      # end
      # if screening_array.length >= 15
        # markers = screening_array.map { |e|  "#{e.latitude.round(1)},#{e.longitude.round(1)}" }
        # url_params = (static_params + markers).join("|")
        # File.open("maps/#{state}.png", 'wb') do |fo|
          # fo.write open("http://maps.googleapis.com/maps/api/staticmap?#{url_params}").read
        # end
      # end
    # end

  end

  def map
  end

  # GET /screenings/1
  # GET /screenings/1.json
  def show
  end

  # GET /screenings/new
  def new
    @screening = Screening.new
  end

  # GET /screenings/1/edit
  def edit
  end

  # POST /screenings
  # POST /screenings.json
  def create
    @screening = Screening.new(screening_params)

    respond_to do |format|
      if @screening.save
        format.html { redirect_to @screening, notice: 'Screening was successfully created.' }
        format.json { render :show, status: :created, location: @screening }
      else
        format.html { render :new }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screenings/1
  # PATCH/PUT /screenings/1.json
  def update
    respond_to do |format|
      if @screening.update(screening_params)
        format.html { redirect_to @screening, notice: 'Screening was successfully updated.' }
        format.json { render :show, status: :ok, location: @screening }
      else
        format.html { render :edit }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screenings/1
  # DELETE /screenings/1.json
  def destroy
    @screening.destroy
    respond_to do |format|
      format.html { redirect_to screenings_url, notice: 'Screening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screening
      @screening = Screening.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screening_params
      params.require(:screening).permit(:date_and_time, :address, :latitude, :longitude)
    end
end
